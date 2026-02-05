<?php

namespace App\Filament\Pages\Reports;

use App\Models\Jemaat;
use Filament\Pages\Page;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Concerns\InteractsWithTable;
use Filament\Tables\Contracts\HasTable;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Filament\Actions\ExportAction;
use UnitEnum;
use BackedEnum;

class LaporanJenisKelamin extends Page implements HasTable
{
    use InteractsWithTable, \App\Traits\HasOperatorAccess;

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-users';

    protected string $view = 'filament.pages.reports.laporan-jenis-kelamin';

    protected static string|UnitEnum|null $navigationGroup = 'Laporan';

    protected static ?string $navigationLabel = 'Laporan Jenis Kelamin';

    protected static ?string $title = 'Laporan Jemaat Berdasarkan Jenis Kelamin';

    protected static ?int $navigationSort = 3;

    public function table(Table $table): Table
    {
        return $table
            ->query($this->getTableQuery())
            ->columns([
                TextColumn::make('nama')
                    ->label('Nama Lengkap')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('jenis_kelamin')
                    ->label('Jenis Kelamin')
                    ->formatStateUsing(fn (string $state): string => $state === 'L' ? 'Laki-laki' : 'Perempuan')
                    ->sortable()
                    ->badge()
                    ->color(fn (string $state): string => $state === 'L' ? 'info' : 'warning'),
                TextColumn::make('tanggal_lahir')
                    ->label('Tanggal Lahir')
                    ->date('d F Y')
                    ->sortable(),
                TextColumn::make('usia')
                    ->label('Usia')
                    ->state(function (Jemaat $record): string {
                        return $record->usia ? $record->usia . ' tahun' : '-';
                    }),
                TextColumn::make('no_telepon')
                    ->label('No. Telepon')
                    ->searchable(),
                TextColumn::make('status_pernikahan')
                    ->label('Status Pernikahan'),
                TextColumn::make('komsel.nama_komsel')
                    ->label('Komsel')
                    ->sortable(),
            ])
            ->filters([
                \Filament\Tables\Filters\SelectFilter::make('jenis_kelamin')
                    ->label('Jenis Kelamin')
                    ->options([
                        'L' => 'Laki-laki',
                        'P' => 'Perempuan',
                    ])
                    ->query(function (Builder $query, array $data) {
                        if (isset($data['value'])) {
                            return $query->byJenisKelamin($data['value']);
                        }
                        return $query;
                    }),
            ])
            ->actions([])
            ->headerActions([
                ExportAction::make()
                    ->label('Ekspor ke Excel')
                    ->exporter(\App\Filament\Exports\LaporanJenisKelaminExporter::class),
            ])
            ->defaultSort('jenis_kelamin', 'asc');
    }

    protected function getTableQuery(): Builder
    {
        return Jemaat::query();
    }

    protected function getHeaderWidgets(): array
    {
        return [];
    }
}
