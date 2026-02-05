<?php

namespace App\Filament\Pages\Reports;

use App\Models\Jemaat;
use App\Models\JadwalIbadah;
use Filament\Pages\Page;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Concerns\InteractsWithTable;
use Filament\Tables\Contracts\HasTable;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Filament\Actions\ExportAction;
use UnitEnum;
use BackedEnum;

class LaporanIbadah extends Page implements HasTable
{
    use InteractsWithTable, \App\Traits\HasOperatorAccess;

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-building-library';

    protected string $view = 'filament.pages.reports.laporan-ibadah';

    protected static string|UnitEnum|null $navigationGroup = 'Laporan';

    protected static ?string $navigationLabel = 'Laporan Ibadah';

    protected static ?string $title = 'Laporan Jemaat Berdasarkan Ibadah';

    protected static ?int $navigationSort = 5;

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
                    ->sortable(),
                TextColumn::make('daftarPelayanans_count')
                    ->label('Total Pelayanan')
                    ->counts('daftarPelayanans')
                    ->sortable(),
                TextColumn::make('pelayanan_terakhir')
                    ->label('Pelayanan Terakhir')
                    ->state(function (Jemaat $record): string {
                        $pelayananTerakhir = $record->daftarPelayanans()
                            ->with('jadwalIbadah')
                            ->latest('tanggal')
                            ->first();
                        
                        if (!$pelayananTerakhir) {
                            return '-';
                        }
                        
                        return $pelayananTerakhir->jadwalIbadah->nama_ibadah . 
                               ' (' . $pelayananTerakhir->tanggal->format('d/m/Y') . ')';
                    }),
                TextColumn::make('no_telepon')
                    ->label('No. Telepon')
                    ->searchable(),
                TextColumn::make('komsel.nama_komsel')
                    ->label('Komsel')
                    ->sortable(),
            ])
            ->filters([
                \Filament\Tables\Filters\SelectFilter::make('jadwal_ibadah_id')
                    ->label('Jadwal Ibadah')
                    ->options(JadwalIbadah::pluck('nama_ibadah', 'id'))
                    ->query(function (Builder $query, array $data) {
                        if (isset($data['value'])) {
                            return $query->whereHas('daftarPelayanans', function (Builder $q) use ($data) {
                                $q->where('jadwal_ibadah_id', $data['value']);
                            });
                        }
                        return $query;
                    }),
            ])
            ->actions([])
            ->headerActions([
                ExportAction::make()
                    ->label('Ekspor ke Excel')
                    ->exporter(\App\Filament\Exports\LaporanIbadahExporter::class),
            ])
            ->defaultSort('daftarPelayanans_count', 'desc');
    }

    protected function getTableQuery(): Builder
    {
        return Jemaat::query()
            ->has('daftarPelayanans')
            ->withCount('daftarPelayanans');
    }
}
