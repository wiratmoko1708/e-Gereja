<?php

namespace App\Filament\Resources\DaftarPelayanans;

use App\Filament\Resources\DaftarPelayanans\Pages\CreateDaftarPelayanan;
use App\Filament\Resources\DaftarPelayanans\Pages\EditDaftarPelayanan;
use App\Filament\Resources\DaftarPelayanans\Pages\ListDaftarPelayanans;
use App\Models\DaftarPelayanan;
use UnitEnum;
use BackedEnum;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class DaftarPelayananResource extends Resource
{
    protected static ?string $model = DaftarPelayanan::class;

    protected static ?string $modelLabel = 'Daftar Pelayanan';

    protected static ?string $pluralModelLabel = 'Daftar Pelayanan';

    protected static string|UnitEnum|null $navigationGroup = 'Master Data';

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-clipboard-document-list';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->schema([
                Select::make('jadwal_ibadah_id')
                    ->label('Jadwal Ibadah')
                    ->relationship('jadwalIbadah', 'nama_ibadah')
                    ->required()
                    ->searchable()
                    ->preload(),
                DatePicker::make('tanggal')
                    ->label('Tanggal')
                    ->required(),
                Select::make('jemaat_id')
                    ->label('Pelayan (Jemaat)')
                    ->relationship('jemaat', 'nama')
                    ->required()
                    ->searchable()
                    ->preload(),
                Select::make('talenta_id')
                    ->label('Talenta / Peran')
                    ->relationship('talenta', 'nama_talenta')
                    ->searchable()
                    ->preload(),
                Textarea::make('keterangan')
                    ->label('Keterangan')
                    ->columnSpanFull(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('tanggal')
                    ->label('Tanggal')
                    ->date()
                    ->sortable(),
                TextColumn::make('jadwalIbadah.nama_ibadah')
                    ->label('Ibadah')
                    ->sortable(),
                TextColumn::make('jemaat.nama')
                    ->label('Pelayan')
                    ->searchable(),
                TextColumn::make('talenta.nama_talenta')
                    ->label('Talenta')
                    ->searchable(),
                TextColumn::make('keterangan')
                    ->label('Keterangan')
                    ->limit(50),
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
                    ->exporter(\App\Filament\Exports\DaftarPelayananExporter::class)
                    ->label('Ekspor Data'),
                \Filament\Actions\Action::make('cetak')
                    ->label('Cetak Data')
                    ->icon('heroicon-o-printer')
                    ->url(fn () => route('cetak.daftar-pelayanan'))
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
            'index' => ListDaftarPelayanans::route('/'),
            'create' => CreateDaftarPelayanan::route('/create'),
            'edit' => EditDaftarPelayanan::route('/{record}/edit'),
        ];
    }
}
