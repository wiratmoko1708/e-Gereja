<?php

namespace App\Filament\Resources\BaptisanAirs\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Actions\DeleteAction;
use Filament\Tables\Table;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ImageColumn;

class BaptisanAirsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('nomer_kartu')->label('Nomer Kartu')->sortable()->searchable(),
                TextColumn::make('nomer_jemaat')->label('Nomer Jemaat')->sortable()->searchable(),
                TextColumn::make('nama')->label('Nama')->sortable()->searchable(),
                TextColumn::make('jenis_kelamin')->label('Jenis Kelamin')->sortable(),
                TextColumn::make('tempat_lahir')->label('Tempat Lahir')->sortable(),
                TextColumn::make('tanggal_lahir')->label('Tanggal Lahir')->formatStateUsing(fn ($state) => $state ? \Carbon\Carbon::parse($state)->locale('id')->translatedFormat('d F Y') : '-')->sortable(),
                TextColumn::make('nama_ayah')->label('Nama Ayah')->sortable(),
                TextColumn::make('nama_ibu')->label('Nama Ibu')->sortable(),
                TextColumn::make('tanggal_baptis')->label('Tanggal Baptis')->formatStateUsing(fn ($state) => $state ? \Carbon\Carbon::parse($state)->locale('id')->translatedFormat('d F Y') : '-')->sortable(),
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
