<?php

namespace App\Filament\Resources\Talentas;

use App\Filament\Resources\Talentas\Pages\CreateTalenta;
use App\Filament\Resources\Talentas\Pages\EditTalenta;
use App\Filament\Resources\Talentas\Pages\ListTalentas;
use App\Models\Talenta;
use UnitEnum;
use BackedEnum;
use Filament\Forms\Components\TextInput;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class TalentaResource extends Resource
{
    protected static ?string $model = Talenta::class;

    protected static ?string $modelLabel = 'Talenta';

    protected static ?string $pluralModelLabel = 'Talenta';

    protected static string|UnitEnum|null $navigationGroup = 'Master Data';

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-sparkles';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->schema([
                TextInput::make('nama_talenta')
                    ->label('Nama Talenta')
                    ->required()
                    ->maxLength(255),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('nama_talenta')
                    ->label('Talenta')
                    ->searchable()
                    ->sortable(),
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
                    ->exporter(\App\Filament\Exports\TalentaExporter::class)
                    ->label('Ekspor Data'),
                \Filament\Actions\Action::make('cetak')
                    ->label('Cetak Data')
                    ->icon('heroicon-o-printer')
                    ->url(fn () => route('cetak.talenta'))
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
            'index' => ListTalentas::route('/'),
            'create' => CreateTalenta::route('/create'),
            'edit' => EditTalenta::route('/{record}/edit'),
        ];
    }
}
