<?php

namespace App\Filament\Exports;

use App\Models\Jemaat;
use Filament\Actions\Exports\ExportColumn;
use Filament\Actions\Exports\Exporter;
use Filament\Actions\Exports\Models\Export;

class LaporanIbadahExporter extends Exporter
{
    protected static ?string $model = Jemaat::class;

    public static function getColumns(): array
    {
        return [
            ExportColumn::make('nama')->label('Nama Jemaat'),
            ExportColumn::make('jenis_kelamin')
                ->label('Jenis Kelamin')
                ->formatStateUsing(fn ($state) => $state === 'L' ? 'Laki-laki' : 'Perempuan'),
            ExportColumn::make('total_pelayanan')
                ->label('Total Pelayanan')
                ->formatStateUsing(fn ($record) => $record->daftarPelayanans()->count()),
            ExportColumn::make('pelayanan_terakhir')
                ->label('Pelayanan Terakhir')
                ->formatStateUsing(function ($record) {
                    $pelayananTerakhir = $record->daftarPelayanans()
                        ->with('jadwalIbadah')
                        ->latest('tanggal')
                        ->first();
                    
                    if (!$pelayananTerakhir) {
                        return '-';
                    }
                    
                    return $pelayananTerakhir->jadwalIbadah->nama_ibadah . 
                           ' (' . $pelayananTerakhir->tanggal->format('d/m/Y') . ')';
                }),
            ExportColumn::make('no_telepon')->label('No. Telepon'),
            ExportColumn::make('komsel.nama_komsel')->label('Komsel'),
        ];
    }

    public static function getCompletedNotificationBody(Export $export): string
    {
        return 'Laporan Ibadah berhasil diekspor. ' . number_format($export->successful_rows) . ' baris berhasil diekspor.';
    }
}
