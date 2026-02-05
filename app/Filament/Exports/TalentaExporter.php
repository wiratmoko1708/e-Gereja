<?php

namespace App\Filament\Exports;

use App\Models\Talenta;
use Filament\Actions\Exports\ExportColumn;
use Filament\Actions\Exports\Exporter;
use Filament\Actions\Exports\Models\Export;

class TalentaExporter extends Exporter
{
    protected static ?string $model = Talenta::class;

    public static function getColumns(): array
    {
        return [
            ExportColumn::make('nama_talenta')->label('Nama Talenta'),
        ];
    }

    public static function getCompletedNotificationBody(Export $export): string
    {
        return 'Data Talenta berhasil diekspor. ' . number_format($export->successful_rows) . ' baris berhasil diekspor.';
    }
}
