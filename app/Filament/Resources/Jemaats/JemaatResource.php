<?php

namespace App\Filament\Resources\Jemaats;

use App\Filament\Resources\Jemaats\Pages\CreateJemaat;
use App\Filament\Resources\Jemaats\Pages\EditJemaat;
use App\Filament\Resources\Jemaats\Pages\ListJemaats;
use App\Models\Jemaat;
use UnitEnum;
use BackedEnum;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
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

class JemaatResource extends Resource
{
    protected static ?string $model = Jemaat::class;

    protected static ?string $modelLabel = 'Jemaat';

    protected static ?string $pluralModelLabel = 'Jemaat';

    protected static string|UnitEnum|null $navigationGroup = 'Master Data';

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-users';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->schema([
                TextInput::make('nama')
                    ->label('Nama Lengkap')
                    ->required()
                    ->maxLength(255),
                TextInput::make('tempat_lahir')
                    ->label('Tempat Lahir')
                    ->maxLength(255),
                DatePicker::make('tanggal_lahir')
                    ->label('Tanggal Lahir'),
                Select::make('jenis_kelamin')
                    ->label('Jenis Kelamin')
                    ->options([
                        'L' => 'Laki-laki',
                        'P' => 'Perempuan',
                    ])
                    ->required(),
                Textarea::make('alamat')
                    ->label('Alamat')
                    ->columnSpanFull(),
                TextInput::make('no_telepon')
                    ->label('No Telepon')
                    ->tel()
                    ->maxLength(255),
                TextInput::make('email')
                    ->label('Email')
                    ->email()
                    ->maxLength(255),
                Select::make('status_pernikahan')
                    ->label('Status Pernikahan')
                    ->options([
                        'Menikah' => 'Menikah',
                        'Belum Menikah' => 'Belum Menikah',
                        'Janda' => 'Janda',
                        'Duda' => 'Duda',
                    ]),
                TextInput::make('pekerjaan')
                    ->label('Pekerjaan')
                    ->maxLength(255),
                Select::make('komsel_id')
                    ->label('Komsel')
                    ->relationship('komsel', 'nama_komsel')
                    ->searchable()
                    ->preload(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('nama')
                    ->label('Nama')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('jenis_kelamin')
                    ->label('L/P')
                    ->sortable(),
                TextColumn::make('no_telepon')
                    ->label('Telepon')
                    ->searchable(),
                TextColumn::make('komsel.nama_komsel')
                    ->label('Komsel')
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
                    ->exporter(\App\Filament\Exports\JemaatExporter::class)
                    ->label('Ekspor Data'),
                \Filament\Actions\Action::make('cetak')
                    ->label('Cetak Data')
                    ->icon('heroicon-o-printer')
                    ->url(fn () => route('cetak.jemaat'))
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
            'index' => ListJemaats::route('/'),
            'create' => CreateJemaat::route('/create'),
            'edit' => EditJemaat::route('/{record}/edit'),
        ];
    }
}
