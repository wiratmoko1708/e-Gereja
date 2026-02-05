<?php

namespace App\Filament\Exports;

use App\Models\Jemaat;
use Filament\Actions\Exports\ExportColumn;
use Filament\Actions\Exports\Exporter;
use Filament\Actions\Exports\Models\Export;

class LaporanPelayananExporter extends Exporter
{
    protected static ?string $model = Jemaat::class;

    public static function getColumns(): array
    {
        return [
            ExportColumn::make('nama')->label('Nama Jemaat'),
            ExportColumn::make('jenis_kelamin')
                ->label('Jenis Kelamin')
                ->formatStateUsing(fn ($state) => $state === 'L' ? 'Laki-laki' : 'Perempuan'),
            ExportColumn::make('talenta_pelayanan')
                ->label('Talenta/Pelayanan')
                ->formatStateUsing(function ($record) {
                    $talentas = $record->daftarPelayanans()
                        ->with('talenta')
                        ->get()
                        ->pluck('talenta.nama_talenta')
                        ->unique()
                        ->filter()
                        ->join(', ');
                    
                    return $talentas ?: '-';
                }),
            ExportColumn::make('jumlah_pelayanan')
                ->label('Jumlah Pelayanan')
                ->formatStateUsing(fn ($record) => $record->daftarPelayanans()->count()),
            ExportColumn::make('terakhir_melayani')
                ->label('Terakhir Melayani')
                ->formatStateUsing(function ($record) {
                    $pelayananTerakhir = $record->daftarPelayanans()
                        ->latest('tanggal')
                        ->first();
                    
                    return $pelayananTerakhir ? 
                        $pelayananTerakhir->tanggal->format('d/m/Y') : '-';
                }),
            ExportColumn::make('no_telepon')->label('No. Telepon'),
            ExportColumn::make('komsel.nama_komsel')->label('Komsel'),
        ];
    }

    public static function getCompletedNotificationBody(Export $export): string
    {
        return 'Laporan Pelayanan berhasil diekspor. ' . number_format($export->successful_rows) . ' baris berhasil diekspor.';
    }
}
