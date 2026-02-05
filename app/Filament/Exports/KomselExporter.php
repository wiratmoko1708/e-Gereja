<?php

namespace App\Filament\Exports;

use App\Models\Komsel;
use Filament\Actions\Exports\ExportColumn;
use Filament\Actions\Exports\Exporter;
use Filament\Actions\Exports\Models\Export;

class KomselExporter extends Exporter
{
    protected static ?string $model = Komsel::class;

    public static function getColumns(): array
    {
        return [
            ExportColumn::make('nama_komsel')->label('Nama Komsel'),
            ExportColumn::make('ketua_komsel')->label('Ketua'),
            ExportColumn::make('jadwal_komsel')->label('Jadwal'),
        ];
    }

    public static function getCompletedNotificationBody(Export $export): string
    {
        return 'Data Komsel berhasil diekspor. ' . number_format($export->successful_rows) . ' baris berhasil diekspor.';
    }
}
