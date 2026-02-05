<?php

namespace App\Filament\Resources\JadwalIbadahs;

use App\Filament\Resources\JadwalIbadahs\Pages\CreateJadwalIbadah;
use App\Filament\Resources\JadwalIbadahs\Pages\EditJadwalIbadah;
use App\Filament\Resources\JadwalIbadahs\Pages\ListJadwalIbadahs;
use App\Models\JadwalIbadah;
use UnitEnum;
use BackedEnum;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\TimePicker;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class JadwalIbadahResource extends Resource
{
    protected static ?string $model = JadwalIbadah::class;

    protected static ?string $modelLabel = 'Jadwal Ibadah';

    protected static ?string $pluralModelLabel = 'Jadwal Ibadah';

    protected static string|UnitEnum|null $navigationGroup = 'Master Data';

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-calendar';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->schema([
                TextInput::make('nama_ibadah')
                    ->label('Nama Ibadah')
                    ->required()
                    ->maxLength(255),
                Select::make('hari')
                    ->label('Hari')
                    ->options([
                        'Minggu' => 'Minggu',
                        'Senin' => 'Senin',
                        'Selasa' => 'Selasa',
                        'Rabu' => 'Rabu',
                        'Kamis' => 'Kamis',
                        'Jumat' => 'Jumat',
                        'Sabtu' => 'Sabtu',
                    ])
                    ->required(),
                TimePicker::make('waktu_mulai')
                    ->label('Waktu Mulai')
                    ->required(),
                TextInput::make('lokasi')
                    ->label('Lokasi')
                    ->maxLength(255),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('nama_ibadah')
                    ->label('Nama Ibadah')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('hari')
                    ->label('Hari')
                    ->sortable(),
                TextColumn::make('waktu_mulai')
                    ->label('Waktu'),
                TextColumn::make('lokasi')
                    ->label('Lokasi'),
            ])
            ->filters([
                //
            ])
            ->actions([
                EditAction::make(),
                DeleteAction::make(),
            ])
            ->bulkActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ])
            ->headerActions([
                \Filament\Actions\ExportAction::make()
                    ->exporter(\App\Filament\Exports\JadwalIbadahExporter::class)
                    ->label('Ekspor Data'),
                \Filament\Actions\Action::make('cetak')
                    ->label('Cetak Data')
                    ->icon('heroicon-o-printer')
                    ->url(fn () => route('cetak.jadwal-ibadah'))
                    ->openUrlInNewTab(),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => ListJadwalIbadahs::route('/'),
            'create' => CreateJadwalIbadah::route('/create'),
            'edit' => EditJadwalIbadah::route('/{record}/edit'),
        ];
    }
}
