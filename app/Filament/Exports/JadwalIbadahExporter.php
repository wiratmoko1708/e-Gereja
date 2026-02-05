<?php

namespace App\Filament\Exports;

use App\Models\JadwalIbadah;
use Filament\Actions\Exports\ExportColumn;
use Filament\Actions\Exports\Exporter;
use Filament\Actions\Exports\Models\Export;

class JadwalIbadahExporter extends Exporter
{
    protected static ?string $model = JadwalIbadah::class;

    public static function getColumns(): array
    {
        return [
            ExportColumn::make('nama_ibadah')->label('Nama Ibadah'),
            ExportColumn::make('hari')->label('Hari'),
            ExportColumn::make('waktu_mulai')->label('Waktu'),
            ExportColumn::make('lokasi')->label('Lokasi'),
        ];
    }

    public static function getCompletedNotificationBody(Export $export): string
    {
        return 'Data Jadwal Ibadah berhasil diekspor. ' . number_format($export->successful_rows) . ' baris berhasil diekspor.';
    }
}
