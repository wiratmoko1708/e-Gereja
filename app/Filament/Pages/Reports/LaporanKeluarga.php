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

class LaporanKeluarga extends Page implements HasTable
{
    use InteractsWithTable, \App\Traits\HasOperatorAccess;

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-home';

    protected string $view = 'filament.pages.reports.laporan-keluarga';

    protected static string|UnitEnum|null $navigationGroup = 'Laporan';

    protected static ?string $navigationLabel = 'Laporan Keluarga';

    protected static ?string $title = 'Laporan Jemaat Berdasarkan Status Pernikahan';

    protected static ?int $navigationSort = 4;

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
                    ->label('L/P')
                    ->sortable(),
                TextColumn::make('status_pernikahan')
                    ->label('Status Pernikahan')
                    ->sortable()
                    ->badge()
                    ->color(fn (?string $state): string => match ($state) {
                        'Menikah' => 'success',
                        'Belum Menikah' => 'info',
                        'Janda' => 'warning',
                        'Duda' => 'warning',
                        default => 'gray',
                    }),
                TextColumn::make('tanggal_lahir')
                    ->label('Tanggal Lahir')
                    ->date('d F Y')
                    ->sortable(),
                TextColumn::make('usia')
                    ->label('Usia')
                    ->state(function (Jemaat $record): string {
                        return $record->usia ? $record->usia . ' tahun' : '-';
                    }),
                TextColumn::make('pekerjaan')
                    ->label('Pekerjaan'),
                TextColumn::make('alamat')
                    ->label('Alamat')
                    ->limit(30),
                TextColumn::make('komsel.nama_komsel')
                    ->label('Komsel')
                    ->sortable(),
            ])
            ->filters([
                \Filament\Tables\Filters\SelectFilter::make('status_pernikahan')
                    ->label('Status Pernikahan')
                    ->options([
                        'Menikah' => 'Menikah',
                        'Belum Menikah' => 'Belum Menikah',
                        'Janda' => 'Janda',
                        'Duda' => 'Duda',
                    ])
                    ->query(function (Builder $query, array $data) {
                        if (isset($data['value'])) {
                            return $query->byStatusPernikahan($data['value']);
                        }
                        return $query;
                    }),
            ])
            ->actions([])
            ->headerActions([
                ExportAction::make()
                    ->label('Ekspor ke Excel')
                    ->exporter(\App\Filament\Exports\LaporanKeluargaExporter::class),
            ])
            ->defaultSort('status_pernikahan', 'asc');
    }

    protected function getTableQuery(): Builder
    {
        return Jemaat::query();
    }
}
