<?php

namespace App\Filament\Resources\ProfilGerejas\Tables;


use Filament\Actions\Action;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class ProfilGerejasTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('nama_gereja')->label('Nama Gereja')->searchable(),
                TextColumn::make('alamat')->label('Alamat')->limit(50),
                TextColumn::make('kota')->label('Kota')->sortable(),
                TextColumn::make('telepon')->label('Telepon'),
                TextColumn::make('email')->label('Email'),
                TextColumn::make('website')->label('Website'),
                TextColumn::make('nama_gembala')->label('Nama Gembala')->searchable(),
                ImageColumn::make('logo')->label('Logo')->disk('public'),
            ])
            ->filters([
                //
            ])
            ->recordActions([
                EditAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}
