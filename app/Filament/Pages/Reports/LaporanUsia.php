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

class LaporanUsia extends Page implements HasTable
{
    use InteractsWithTable, \App\Traits\HasOperatorAccess;

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-user-group';

    protected string $view = 'filament.pages.reports.laporan-usia';

    protected static string|UnitEnum|null $navigationGroup = 'Laporan';

    protected static ?string $navigationLabel = 'Laporan Usia';

    protected static ?string $title = 'Laporan Jemaat Berdasarkan Usia';

    protected static ?int $navigationSort = 2;

    public function table(Table $table): Table
    {
        return $table
            ->query($this->getTableQuery())
            ->columns([
                TextColumn::make('nama')
                    ->label('Nama Lengkap')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('tanggal_lahir')
                    ->label('Tanggal Lahir')
                    ->date('d F Y')
                    ->sortable(),
                TextColumn::make('usia')
                    ->label('Usia')
                    ->state(function (Jemaat $record): string {
                        return $record->usia ? $record->usia . ' tahun' : '-';
                    })
                    ->sortable(query: function (Builder $query, string $direction): Builder {
                        return $query->orderBy('tanggal_lahir', $direction === 'asc' ? 'desc' : 'asc');
                    }),
                TextColumn::make('rentang_usia')
                    ->label('Rentang Usia')
                    ->state(function (Jemaat $record): string {
                        $usia = $record->usia;
                        if (!$usia) return '-';
                        
                        if ($usia <= 12) return 'Anak (0-12 tahun)';
                        if ($usia <= 17) return 'Remaja (13-17 tahun)';
                        if ($usia <= 30) return 'Pemuda (18-30 tahun)';
                        if ($usia <= 50) return 'Dewasa (31-50 tahun)';
                        return 'Lansia (51+ tahun)';
                    }),
                TextColumn::make('jenis_kelamin')
                    ->label('L/P')
                    ->sortable(),
                TextColumn::make('komsel.nama_komsel')
                    ->label('Komsel')
                    ->sortable(),
            ])
            ->filters([
                \Filament\Tables\Filters\SelectFilter::make('rentang_usia')
                    ->label('Rentang Usia')
                    ->options([
                        'anak' => 'Anak (0-12 tahun)',
                        'remaja' => 'Remaja (13-17 tahun)',
                        'pemuda' => 'Pemuda (18-30 tahun)',
                        'dewasa' => 'Dewasa (31-50 tahun)',
                        'lansia' => 'Lansia (51+ tahun)',
                    ])
                    ->query(function (Builder $query, array $data) {
                        if (!isset($data['value'])) {
                            return $query;
                        }

                        return match ($data['value']) {
                            'anak' => $query->byRentangUsia(0, 12),
                            'remaja' => $query->byRentangUsia(13, 17),
                            'pemuda' => $query->byRentangUsia(18, 30),
                            'dewasa' => $query->byRentangUsia(31, 50),
                            'lansia' => $query->byRentangUsia(51),
                            default => $query,
                        };
                    }),
            ])
            ->actions([])
            ->headerActions([
                ExportAction::make()
                    ->label('Ekspor ke Excel')
                    ->exporter(\App\Filament\Exports\LaporanUsiaExporter::class),
            ])
            ->defaultSort('tanggal_lahir', 'desc');
    }

    protected function getTableQuery(): Builder
    {
        return Jemaat::query()->whereNotNull('tanggal_lahir');
    }
}
