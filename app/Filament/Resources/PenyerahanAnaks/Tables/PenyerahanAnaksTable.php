<?php

namespace App\Filament\Resources\PenyerahanAnaks\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Actions\DeleteAction;
use Filament\Tables\Table;
use Filament\Tables\Columns\TextColumn;

class PenyerahanAnaksTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('nomer_kartu')->label('Nomer Kartu')->sortable()->searchable(),
                TextColumn::make('nama_anak')->label('Nama Anak')->sortable()->searchable(),
                TextColumn::make('jenis_kelamin')->label('Jenis Kelamin')->sortable(),
                TextColumn::make('tempat_lahir')->label('Tempat Lahir')->sortable(),
                TextColumn::make('tanggal_lahir')->label('Tanggal Lahir')->formatStateUsing(fn ($state) => $state ? \Carbon\Carbon::parse($state)->locale('id')->translatedFormat('d F Y') : '-')->sortable(),
                TextColumn::make('nama_ayah')->label('Nama Ayah')->sortable()->searchable(),
                TextColumn::make('nama_ibu')->label('Nama Ibu')->sortable()->searchable(),
                TextColumn::make('alamat')->label('Alamat')->limit(50),
                TextColumn::make('tanggal_penyerahan')->label('Tanggal Penyerahan')->formatStateUsing(fn ($state) => $state ? \Carbon\Carbon::parse($state)->locale('id')->translatedFormat('d F Y') : '-')->sortable(),
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
