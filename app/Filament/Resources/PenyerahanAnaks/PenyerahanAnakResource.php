<?php

namespace App\Filament\Resources\PenyerahanAnaks;

use App\Filament\Resources\PenyerahanAnaks\Pages\CreatePenyerahanAnak;
use App\Filament\Resources\PenyerahanAnaks\Pages\EditPenyerahanAnak;
use App\Filament\Resources\PenyerahanAnaks\Pages\ListPenyerahanAnaks;
use App\Filament\Resources\PenyerahanAnaks\Schemas\PenyerahanAnakForm;
use App\Filament\Resources\PenyerahanAnaks\Tables\PenyerahanAnaksTable;
use App\Models\PenyerahanAnak;
use BackedEnum;
use UnitEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class PenyerahanAnakResource extends Resource
{
    protected static ?string $model = PenyerahanAnak::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    protected static ?string $recordTitleAttribute = 'nama_anak';

    protected static string|UnitEnum|null $navigationGroup = 'Pelayanan Pastoral';

    protected static ?string $modelLabel = 'Penyerahan Anak';

    protected static ?string $pluralModelLabel = 'Penyerahan Anak';

    public static function form(Schema $schema): Schema
    {
        return PenyerahanAnakForm::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return PenyerahanAnaksTable::configure($table);
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
            'index' => ListPenyerahanAnaks::route('/'),
            'create' => CreatePenyerahanAnak::route('/create'),
            'edit' => EditPenyerahanAnak::route('/{record}/edit'),
        ];
    }
}
