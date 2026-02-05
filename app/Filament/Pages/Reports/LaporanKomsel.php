<?php

namespace App\Filament\Pages\Reports;

use App\Models\Jemaat;
use App\Models\Komsel;
use Filament\Pages\Page;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Concerns\InteractsWithTable;
use Filament\Tables\Contracts\HasTable;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Filament\Actions\ExportAction;
use UnitEnum;
use BackedEnum;

class LaporanKomsel extends Page implements HasTable
{
    use InteractsWithTable, \App\Traits\HasOperatorAccess;

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-user-group';

    protected string $view = 'filament.pages.reports.laporan-komsel';

    protected static string|UnitEnum|null $navigationGroup = 'Laporan';

    protected static ?string $navigationLabel = 'Laporan Komsel';

    protected static ?string $title = 'Laporan Jemaat Berdasarkan Komsel';

    protected static ?int $navigationSort = 7;

    public function table(Table $table): Table
    {
        return $table
            ->query($this->getTableQuery())
            ->columns([
                TextColumn::make('nama')
                    ->label('Nama Jemaat')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('jenis_kelamin')
                    ->label('L/P')
                    ->formatStateUsing(fn (string $state): string => $state === 'L' ? 'Laki-laki' : 'Perempuan')
                    ->sortable(),
                TextColumn::make('tanggal_lahir')
                    ->label('Tanggal Lahir')
                    ->date('d F Y')
                    ->sortable(),
                TextColumn::make('usia')
                    ->label('Usia')
                    ->state(function (Jemaat $record): string {
                        return $record->usia ? $record->usia . ' tahun' : '-';
                    }),
                TextColumn::make('komsel.nama_komsel')
                    ->label('Nama Komsel')
                    ->sortable()
                    ->searchable(),
                TextColumn::make('komsel.ketua_komsel')
                    ->label('Ketua Komsel')
                    ->sortable(),
                TextColumn::make('komsel.jadwal_komsel')
                    ->label('Jadwal Komsel'),
                TextColumn::make('no_telepon')
                    ->label('No. Telepon')
                    ->searchable(),
            ])
            ->filters([
                \Filament\Tables\Filters\SelectFilter::make('komsel_id')
                    ->label('Komsel')
                    ->options(Komsel::pluck('nama_komsel', 'id'))
                    ->query(function (Builder $query, array $data) {
                        if (isset($data['value'])) {
                            return $query->byKomsel($data['value']);
                        }
                        return $query;
                    }),
            ])
            ->actions([])
            ->headerActions([
                ExportAction::make()
                    ->label('Ekspor ke Excel')
                    ->exporter(\App\Filament\Exports\LaporanKomselExporter::class),
            ])
            ->groups([
                \Filament\Tables\Grouping\Group::make('komsel.nama_komsel')
                    ->label('Komsel')
                    ->collapsible(),
            ])
            ->defaultSort('komsel.nama_komsel', 'asc');
    }

    protected function getTableQuery(): Builder
    {
        return Jemaat::query()->whereNotNull('komsel_id');
    }
}
