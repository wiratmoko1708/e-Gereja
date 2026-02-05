<?php

namespace App\Filament\Pages\Reports;

use App\Models\Jemaat;
use App\Models\Talenta;
use Filament\Pages\Page;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Concerns\InteractsWithTable;
use Filament\Tables\Contracts\HasTable;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Filament\Actions\ExportAction;
use UnitEnum;
use BackedEnum;

class LaporanPelayanan extends Page implements HasTable
{
    use InteractsWithTable, \App\Traits\HasOperatorAccess;

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-sparkles';

    protected string $view = 'filament.pages.reports.laporan-pelayanan';

    protected static string|UnitEnum|null $navigationGroup = 'Laporan';

    protected static ?string $navigationLabel = 'Laporan Pelayanan';

    protected static ?string $title = 'Laporan Jemaat Berdasarkan Pelayanan/Talenta';

    protected static ?int $navigationSort = 6;

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
                TextColumn::make('talenta_pelayanan')
                    ->label('Talenta/Pelayanan')
                    ->state(function (Jemaat $record): string {
                        $talentas = $record->daftarPelayanans()
                            ->with('talenta')
                            ->get()
                            ->pluck('talenta.nama_talenta')
                            ->unique()
                            ->filter()
                            ->join(', ');
                        
                        return $talentas ?: '-';
                    }),
                TextColumn::make('daftarPelayanans_count')
                    ->label('Jumlah Pelayanan')
                    ->counts('daftarPelayanans')
                    ->sortable(),
                TextColumn::make('pelayanan_terakhir')
                    ->label('Terakhir Melayani')
                    ->state(function (Jemaat $record): string {
                        $pelayananTerakhir = $record->daftarPelayanans()
                            ->latest('tanggal')
                            ->first();
                        
                        return $pelayananTerakhir ? 
                            $pelayananTerakhir->tanggal->format('d/m/Y') : '-';
                    }),
                TextColumn::make('no_telepon')
                    ->label('No. Telepon')
                    ->searchable(),
                TextColumn::make('komsel.nama_komsel')
                    ->label('Komsel')
                    ->sortable(),
            ])
            ->filters([
                \Filament\Tables\Filters\SelectFilter::make('talenta_id')
                    ->label('Talenta')
                    ->options(Talenta::pluck('nama_talenta', 'id'))
                    ->query(function (Builder $query, array $data) {
                        if (isset($data['value'])) {
                            return $query->whereHas('daftarPelayanans', function (Builder $q) use ($data) {
                                $q->where('talenta_id', $data['value']);
                            });
                        }
                        return $query;
                    }),
            ])
            ->actions([])
            ->headerActions([
                ExportAction::make()
                    ->label('Ekspor ke Excel')
                    ->exporter(\App\Filament\Exports\LaporanPelayananExporter::class),
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
