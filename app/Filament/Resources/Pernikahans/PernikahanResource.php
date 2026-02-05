<?php

namespace App\Filament\Resources\Pernikahans;

use App\Filament\Resources\Pernikahans\Pages\CreatePernikahan;
use App\Filament\Resources\Pernikahans\Pages\EditPernikahan;
use App\Filament\Resources\Pernikahans\Pages\ListPernikahans;
use App\Filament\Resources\Pernikahans\Schemas\PernikahanForm;
use App\Filament\Resources\Pernikahans\Tables\PernikahansTable;
use App\Models\Pernikahan;
use BackedEnum;
use UnitEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class PernikahanResource extends Resource
{
    protected static ?string $model = Pernikahan::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    protected static ?string $recordTitleAttribute = 'nomer_pernikahan';

    protected static string|UnitEnum|null $navigationGroup = 'Pelayanan Pastoral';

    protected static ?string $modelLabel = 'Pernikahan';

    protected static ?string $pluralModelLabel = 'Pernikahan';

    public static function form(Schema $schema): Schema
    {
        return PernikahanForm::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return PernikahansTable::configure($table);
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
            'index' => ListPernikahans::route('/'),
            'create' => CreatePernikahan::route('/create'),
            'edit' => EditPernikahan::route('/{record}/edit'),
        ];
    }
}
