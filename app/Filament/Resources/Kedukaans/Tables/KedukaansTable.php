<?php

namespace App\Filament\Resources\Kedukaans\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Actions\DeleteAction;
use Filament\Tables\Table;
use Filament\Tables\Columns\TextColumn;

class KedukaansTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('nomer_surat')->label('Nomer Surat')->sortable()->searchable(),
                TextColumn::make('nomer_jemaat')->label('Nomer Jemaat')->sortable()->searchable(),
                TextColumn::make('nama')->label('Nama')->sortable()->searchable(),
                TextColumn::make('alamat')->label('Alamat')->limit(50),
                TextColumn::make('kota')->label('Kota')->sortable(),
                TextColumn::make('jenis_kelamin')->label('Jenis Kelamin')->sortable(),
                TextColumn::make('tempat_lahir')->label('Tempat Lahir')->sortable(),
                TextColumn::make('tanggal_lahir')->label('Tanggal Lahir')->formatStateUsing(fn ($state) => $state ? \Carbon\Carbon::parse($state)->locale('id')->translatedFormat('d F Y') : '-')->sortable(),
                TextColumn::make('tanggal_kematian')->label('Tanggal Kematian')->formatStateUsing(fn ($state) => $state ? \Carbon\Carbon::parse($state)->locale('id')->translatedFormat('d F Y') : '-')->sortable(),
                TextColumn::make('tempat_pemakaman')->label('Tempat Pemakaman')->sortable(),
                TextColumn::make('tanggal_pemakaman')->label('Tanggal Pemakaman')->formatStateUsing(fn ($state) => $state ? \Carbon\Carbon::parse($state)->locale('id')->translatedFormat('d F Y') : '-')->sortable(),
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
