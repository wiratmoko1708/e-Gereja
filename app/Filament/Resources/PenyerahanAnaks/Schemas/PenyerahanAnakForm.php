<?php

namespace App\Filament\Resources\PenyerahanAnaks\Schemas;

use Filament\Schemas\Schema;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;

class PenyerahanAnakForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('nomer_kartu')
                    ->label('Nomer Kartu')
                    ->required()
                    ->unique(ignoreRecord: true)
                    ->default(function () {
                        $year = date('Y');
                        $prefix = "PA-{$year}";
                        $lastRecord = \App\Models\PenyerahanAnak::where('nomer_kartu', 'like', "{$prefix}-%")
                            ->orderBy('id', 'desc')
                            ->first();

                        if ($lastRecord) {
                            $lastNumber = intval(substr($lastRecord->nomer_kartu, -4));
                            $newNumber = $lastNumber + 1;
                        } else {
                            $newNumber = 1;
                        }

                        return "{$prefix}-" . str_pad($newNumber, 4, '0', STR_PAD_LEFT);
                    })
                    ->readOnly()
                    ->dehydrated(),
                TextInput::make('nama_anak')
                    ->label('Nama Anak')
                    ->required(),
                Select::make('jenis_kelamin')
                    ->label('Jenis Kelamin')
                    ->options([
                        'Laki-Laki' => 'Laki-Laki',
                        'Perempuan' => 'Perempuan',
                    ])
                    ->required(),
                TextInput::make('tempat_lahir')
                    ->label('Tempat Lahir')
                    ->required(),
                DatePicker::make('tanggal_lahir')
                    ->label('Tanggal Lahir')
                    ->required(),
                TextInput::make('nama_ayah')
                    ->label('Nama Ayah')
                    ->required(),
                TextInput::make('nama_ibu')
                    ->label('Nama Ibu')
                    ->required(),
                Textarea::make('alamat')
                    ->label('Alamat')
                    ->required()
                    ->columnSpanFull(),
                DatePicker::make('tanggal_penyerahan')
                    ->label('Tanggal Penyerahan')
                    ->required(),
            ]);
    }
}
