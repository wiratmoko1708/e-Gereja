<?php

namespace App\Filament\Exports;

use App\Models\DaftarPelayanan;
use Filament\Actions\Exports\ExportColumn;
use Filament\Actions\Exports\Exporter;
use Filament\Actions\Exports\Models\Export;

class DaftarPelayananExporter extends Exporter
{
    protected static ?string $model = DaftarPelayanan::class;

    public static function getColumns(): array
    {
        return [
            ExportColumn::make('tanggal')->label('Tanggal'),
            ExportColumn::make('jadwalIbadah.nama_ibadah')->label('Ibadah'),
            ExportColumn::make('jemaat.nama')->label('Pelayan'),
            ExportColumn::make('talenta.nama_talenta')->label('Talenta'),
            ExportColumn::make('keterangan')->label('Keterangan'),
        ];
    }

    public static function getCompletedNotificationBody(Export $export): string
    {
        return 'Data Daftar Pelayanan berhasil diekspor. ' . number_format($export->successful_rows) . ' baris berhasil diekspor.';
    }
}
