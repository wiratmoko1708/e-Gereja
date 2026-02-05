<?php

namespace App\Filament\Resources\Komsels;

use App\Filament\Resources\Komsels\Pages\CreateKomsel;
use App\Filament\Resources\Komsels\Pages\EditKomsel;
use App\Filament\Resources\Komsels\Pages\ListKomsels;
use App\Models\Komsel;
use UnitEnum;
use BackedEnum;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class KomselResource extends Resource
{
    protected static ?string $model = Komsel::class;

    protected static ?string $modelLabel = 'Komsel';

    protected static ?string $pluralModelLabel = 'Komsel';

    protected static string|UnitEnum|null $navigationGroup = 'Master Data';

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-user-group';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->schema([
                TextInput::make('nama_komsel')
                    ->label('Nama Komsel')
                    ->required()
                    ->maxLength(255),
                Textarea::make('alamat')
                    ->label('Alamat')
                    ->columnSpanFull(),
                TextInput::make('ketua_komsel')
                    ->label('Ketua Komsel')
                    ->maxLength(255),
                TextInput::make('jadwal_komsel')
                    ->label('Jadwal Komsel')
                    ->maxLength(255),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('nama_komsel')
                    ->label('Komsel')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('ketua_komsel')
                    ->label('Ketua')
                    ->searchable(),
                TextColumn::make('jadwal_komsel')
                    ->label('Jadwal'),
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
                    ->exporter(\App\Filament\Exports\KomselExporter::class)
                    ->label('Ekspor Data'),
                \Filament\Actions\Action::make('cetak')
                    ->label('Cetak Data')
                    ->icon('heroicon-o-printer')
                    ->url(fn () => route('cetak.komsel'))
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
            'index' => ListKomsels::route('/'),
            'create' => CreateKomsel::route('/create'),
            'edit' => EditKomsel::route('/{record}/edit'),
        ];
    }
}
