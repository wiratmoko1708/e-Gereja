<?php

namespace App\Filament\Resources\ProfilGerejas\Schemas;

use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class ProfilGerejaForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('nama_gereja')
                    ->label('Nama Gereja')
                    ->required(),
                TextInput::make('alamat')
                    ->label('Alamat')
                    ->required(),
                TextInput::make('kota')
                    ->label('Kota')
                    ->required(),
                TextInput::make('telepon')
                    ->label('Telepon')
                    ->tel()
                    ->required(),
                TextInput::make('email')
                    ->label('Email')
                    ->email()
                    ->required(),
                TextInput::make('website')
                    ->label('Website')
                    ->url(),
                TextInput::make('nama_gembala')
                    ->label('Nama Gembala')
                    ->required(),
                FileUpload::make('logo')
                    ->label('Logo')
                    ->image()
                    ->disk('public')
                    ->directory('profil-gereja')
                    ->columnSpanFull(),
            ]);
    }
}
