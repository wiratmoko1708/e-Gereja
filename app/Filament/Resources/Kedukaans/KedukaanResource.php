<?php

namespace App\Filament\Resources\Kedukaans;

use App\Filament\Resources\Kedukaans\Pages\CreateKedukaan;
use App\Filament\Resources\Kedukaans\Pages\EditKedukaan;
use App\Filament\Resources\Kedukaans\Pages\ListKedukaans;
use App\Filament\Resources\Kedukaans\Schemas\KedukaanForm;
use App\Filament\Resources\Kedukaans\Tables\KedukaansTable;
use App\Models\Kedukaan;
use BackedEnum;
use UnitEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class KedukaanResource extends Resource
{
    protected static ?string $model = Kedukaan::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    protected static ?string $recordTitleAttribute = 'nama';

    protected static string|UnitEnum|null $navigationGroup = 'Pelayanan Pastoral';

    protected static ?string $modelLabel = 'Kedukaan';

    protected static ?string $pluralModelLabel = 'Kedukaan';

    public static function form(Schema $schema): Schema
    {
        return KedukaanForm::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return KedukaansTable::configure($table);
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
            'index' => ListKedukaans::route('/'),
            'create' => CreateKedukaan::route('/create'),
            'edit' => EditKedukaan::route('/{record}/edit'),
        ];
    }
}
