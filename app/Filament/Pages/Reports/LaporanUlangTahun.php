<?php

namespace App\Filament\Pages\Reports;

use App\Models\Jemaat;
use Filament\Pages\Page;
use Filament\Forms\Components\Select;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Contracts\HasForms;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Concerns\InteractsWithTable;
use Filament\Tables\Contracts\HasTable;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Filament\Actions\ExportAction;
use Filament\Actions\Action;
use UnitEnum;
use BackedEnum;

class LaporanUlangTahun extends Page implements HasForms, HasTable
{
    use InteractsWithForms;
    use InteractsWithTable, \App\Traits\HasOperatorAccess;

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-cake';

    protected string $view = 'filament.pages.reports.laporan-ulang-tahun';

    protected static string|UnitEnum|null $navigationGroup = 'Laporan';

    protected static ?string $navigationLabel = 'Laporan Ulang Tahun';

    protected static ?string $title = 'Laporan Jemaat Berdasarkan Ulang Tahun';

    protected static ?int $navigationSort = 1;

    public ?array $data = [];

    public function mount(): void
    {
        $this->form->fill();
    }

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
                    }),
                TextColumn::make('jenis_kelamin')
                    ->label('Jenis Kelamin')
                    ->formatStateUsing(fn (string $state): string => $state === 'L' ? 'Laki-laki' : 'Perempuan'),
                TextColumn::make('no_telepon')
                    ->label('No. Telepon')
                    ->searchable(),
                TextColumn::make('komsel.nama_komsel')
                    ->label('Komsel')
                    ->sortable(),
            ])
            ->filters([
                \Filament\Tables\Filters\SelectFilter::make('bulan')
                    ->label('Bulan Lahir')
                    ->options([
                        1 => 'Januari',
                        2 => 'Februari',
                        3 => 'Maret',
                        4 => 'April',
                        5 => 'Mei',
                        6 => 'Juni',
                        7 => 'Juli',
                        8 => 'Agustus',
                        9 => 'September',
                        10 => 'Oktober',
                        11 => 'November',
                        12 => 'Desember',
                    ])
                    ->query(function (Builder $query, array $data) {
                        if (isset($data['value'])) {
                            return $query->byBulanLahir($data['value']);
                        }
                        return $query;
                    }),
            ])
            ->actions([])
            ->headerActions([
                ExportAction::make()
                    ->label('Ekspor ke Excel')
                    ->exporter(\App\Filament\Exports\LaporanUlangTahunExporter::class),
            ])
            ->defaultSort('tanggal_lahir', 'asc');
    }

    protected function getTableQuery(): Builder
    {
        return Jemaat::query()->whereNotNull('tanggal_lahir');
    }
}
