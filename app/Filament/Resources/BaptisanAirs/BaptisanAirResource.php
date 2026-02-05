<?php

namespace App\Filament\Resources\BaptisanAirs;

use App\Filament\Resources\BaptisanAirs\Pages\CreateBaptisanAir;
use App\Filament\Resources\BaptisanAirs\Pages\EditBaptisanAir;
use App\Filament\Resources\BaptisanAirs\Pages\ListBaptisanAirs;
use App\Filament\Resources\BaptisanAirs\Schemas\BaptisanAirForm;
use App\Filament\Resources\BaptisanAirs\Tables\BaptisanAirsTable;
use App\Models\BaptisanAir;
use BackedEnum;
use UnitEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class BaptisanAirResource extends Resource
{
    protected static ?string $model = BaptisanAir::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    protected static ?string $recordTitleAttribute = 'nama';

    protected static string|UnitEnum|null $navigationGroup = 'Pelayanan Pastoral';

    protected static ?string $modelLabel = 'Baptisan Air';

    protected static ?string $pluralModelLabel = 'Baptisan Air';

    public static function form(Schema $schema): Schema
    {
        return BaptisanAirForm::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return BaptisanAirsTable::configure($table);
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
            'index' => ListBaptisanAirs::route('/'),
            'create' => CreateBaptisanAir::route('/create'),
            'edit' => EditBaptisanAir::route('/{record}/edit'),
        ];
    }
}
