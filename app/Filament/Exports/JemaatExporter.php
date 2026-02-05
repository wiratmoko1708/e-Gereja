<?php

namespace App\Filament\Exports;

use App\Models\Jemaat;
use Filament\Actions\Exports\ExportColumn;
use Filament\Actions\Exports\Exporter;
use Filament\Actions\Exports\Models\Export;

class JemaatExporter extends Exporter
{
    protected static ?string $model = Jemaat::class;

    public static function getColumns(): array
    {
        return [
            ExportColumn::make('nama')->label('Nama'),
            ExportColumn::make('jenis_kelamin')->label('Jenis Kelamin'),
            ExportColumn::make('no_telepon')->label('No Telepon'),
            ExportColumn::make('komsel.nama_komsel')->label('Komsel'),
        ];
    }

    public static function getCompletedNotificationBody(Export $export): string
    {
        return 'Data Jemaat berhasil diekspor. ' . number_format($export->successful_rows) . ' baris berhasil diekspor.';
    }
}
