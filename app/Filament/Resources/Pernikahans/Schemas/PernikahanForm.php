<?php

namespace App\Filament\Resources\Pernikahans\Schemas;

use Filament\Schemas\Schema;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\FileUpload;

class PernikahanForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('nomer_pernikahan')
                    ->label('Nomer Pernikahan')
                    ->required()
                    ->unique(ignoreRecord: true)
                    ->default(function () {
                        $year = date('Y');
                        $prefix = "NI-{$year}";
                        $lastRecord = \App\Models\Pernikahan::where('nomer_pernikahan', 'like', "{$prefix}-%")
                            ->orderBy('id', 'desc')
                            ->first();

                        if ($lastRecord) {
                            $lastNumber = intval(substr($lastRecord->nomer_pernikahan, -4));
                            $newNumber = $lastNumber + 1;
                        } else {
                            $newNumber = 1;
                        }

                        return "{$prefix}-" . str_pad($newNumber, 4, '0', STR_PAD_LEFT);
                    })
                    ->readOnly()
                    ->dehydrated(),
                TextInput::make('nama_pria')
                    ->label('Nama Pria')
                    ->required(),
                TextInput::make('tempat_lahir_pria')
                    ->label('Tempat Lahir Pria')
                    ->required(),
                DatePicker::make('tanggal_lahir_pria')
                    ->label('Tanggal Lahir Pria')
                    ->required(),
                TextInput::make('nomer_hp_pria')
                    ->label('Nomer HP Pria')
                    ->required(),
                TextInput::make('nama_wanita')
                    ->label('Nama Wanita')
                    ->required(),
                TextInput::make('tempat_lahir_wanita')
                    ->label('Tempat Lahir Wanita')
                    ->required(),
                DatePicker::make('tanggal_lahir_wanita')
                    ->label('Tanggal Lahir Wanita')
                    ->required(),
                TextInput::make('nomer_hp_wanita')
                    ->label('Nomer HP Wanita')
                    ->required(),
                FileUpload::make('foto')
                    ->label('Foto')
                    ->image()
                    ->directory('pernikahan')
                    ->columnSpanFull(),
            ]);
    }
}
