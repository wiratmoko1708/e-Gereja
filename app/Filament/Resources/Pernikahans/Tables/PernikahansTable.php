<?php

namespace App\Filament\Resources\Pernikahans\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Actions\DeleteAction;
use Filament\Tables\Table;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ImageColumn;

class PernikahansTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('nomer_pernikahan')->label('Nomer Pernikahan')->sortable()->searchable(),
                TextColumn::make('nama_pria')->label('Nama Pria')->sortable()->searchable(),
                TextColumn::make('tempat_lahir_pria')->label('Tempat Lahir Pria')->sortable(),
                TextColumn::make('tanggal_lahir_pria')->label('Tanggal Lahir Pria')->date()->sortable(),
                TextColumn::make('nomer_hp_pria')->label('Nomer HP Pria'),
                TextColumn::make('nama_wanita')->label('Nama Wanita')->sortable()->searchable(),
                TextColumn::make('tempat_lahir_wanita')->label('Tempat Lahir Wanita')->sortable(),
                TextColumn::make('tanggal_lahir_wanita')->label('Tanggal Lahir Wanita')->date()->sortable(),
                TextColumn::make('nomer_hp_wanita')->label('Nomer HP Wanita'),
                ImageColumn::make('foto')->label('Foto'),
            ])
            ->filters([
                //
            ])
            ->recordActions([
                EditAction::make(),
                ViewAction::make(),
                DeleteAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}
