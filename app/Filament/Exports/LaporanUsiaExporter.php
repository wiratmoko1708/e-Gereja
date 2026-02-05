<?php

namespace App\Filament\Exports;

use App\Models\Jemaat;
use Filament\Actions\Exports\ExportColumn;
use Filament\Actions\Exports\Exporter;
use Filament\Actions\Exports\Models\Export;

class LaporanUsiaExporter extends Exporter
{
    protected static ?string $model = Jemaat::class;

    public static function getColumns(): array
    {
        return [
            ExportColumn::make('nama')->label('Nama Lengkap'),
            ExportColumn::make('tanggal_lahir')
                ->label('Tanggal Lahir')
                ->formatStateUsing(fn ($state) => $state ? $state->format('d F Y') : '-'),
            ExportColumn::make('usia')
                ->label('Usia')
                ->formatStateUsing(fn ($record) => $record->usia ? $record->usia . ' tahun' : '-'),
            ExportColumn::make('rentang_usia')
                ->label('Rentang Usia')
                ->formatStateUsing(function ($record) {
                    $usia = $record->usia;
                    if (!$usia) return '-';
                    
                    if ($usia <= 12) return 'Anak (0-12 tahun)';
                    if ($usia <= 17) return 'Remaja (13-17 tahun)';
                    if ($usia <= 30) return 'Pemuda (18-30 tahun)';
                    if ($usia <= 50) return 'Dewasa (31-50 tahun)';
                    return 'Lansia (51+ tahun)';
                }),
            ExportColumn::make('jenis_kelamin')
                ->label('Jenis Kelamin')
                ->formatStateUsing(fn ($state) => $state === 'L' ? 'Laki-laki' : 'Perempuan'),
            ExportColumn::make('komsel.nama_komsel')->label('Komsel'),
            ExportColumn::make('no_telepon')->label('No. Telepon'),
        ];
    }

    public static function getCompletedNotificationBody(Export $export): string
    {
        return 'Laporan Usia berhasil diekspor. ' . number_format($export->successful_rows) . ' baris berhasil diekspor.';
    }
}
