<?php

namespace App\Filament\Resources\ProfilGerejas;

use App\Filament\Resources\ProfilGerejas\Pages\CreateProfilGereja;
use App\Filament\Resources\ProfilGerejas\Pages\EditProfilGereja;
use App\Filament\Resources\ProfilGerejas\Pages\ListProfilGerejas;
use App\Filament\Resources\ProfilGerejas\Schemas\ProfilGerejaForm;
use App\Filament\Resources\ProfilGerejas\Tables\ProfilGerejasTable;
use App\Models\ProfilGereja;
use BackedEnum;
use UnitEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class ProfilGerejaResource extends Resource
{
    protected static ?string $model = ProfilGereja::class;



    protected static ?string $recordTitleAttribute = 'nama_gereja';

    protected static ?string $modelLabel = 'Profil Gereja';

    protected static ?string $pluralModelLabel = 'Profil Gereja';

    protected static string|UnitEnum|null $navigationGroup = 'Pengaturan';

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-building-library';

    public static function form(Schema $schema): Schema
    {
        return ProfilGerejaForm::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return ProfilGerejasTable::configure($table);
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
            'index' => ListProfilGerejas::route('/'),
            'create' => CreateProfilGereja::route('/create'),
            'edit' => EditProfilGereja::route('/{record}/edit'),
        ];
    }
}
