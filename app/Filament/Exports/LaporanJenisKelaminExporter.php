<?php

namespace App\Filament\Exports;

use App\Models\Jemaat;
use Filament\Actions\Exports\ExportColumn;
use Filament\Actions\Exports\Exporter;
use Filament\Actions\Exports\Models\Export;

class LaporanJenisKelaminExporter extends Exporter
{
    protected static ?string $model = Jemaat::class;

    public static function getColumns(): array
    {
        return [
            ExportColumn::make('nama')->label('Nama Lengkap'),
            ExportColumn::make('jenis_kelamin')
                ->label('Jenis Kelamin')
                ->formatStateUsing(fn ($state) => $state === 'L' ? 'Laki-laki' : 'Perempuan'),
            ExportColumn::make('tanggal_lahir')
                ->label('Tanggal Lahir')
                ->formatStateUsing(fn ($state) => $state ? $state->format('d F Y') : '-'),
            ExportColumn::make('usia')
                ->label('Usia')
                ->formatStateUsing(fn ($record) => $record->usia ? $record->usia . ' tahun' : '-'),
            ExportColumn::make('no_telepon')->label('No. Telepon'),
            ExportColumn::make('status_pernikahan')->label('Status Pernikahan'),
            ExportColumn::make('komsel.nama_komsel')->label('Komsel'),
            ExportColumn::make('alamat')->label('Alamat'),
        ];
    }

    public static function getCompletedNotificationBody(Export $export): string
    {
        return 'Laporan Jenis Kelamin berhasil diekspor. ' . number_format($export->successful_rows) . ' baris berhasil diekspor.';
    }
}
