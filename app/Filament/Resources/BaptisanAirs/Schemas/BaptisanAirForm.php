<?php

namespace App\Filament\Resources\BaptisanAirs\Schemas;

use Filament\Schemas\Schema;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\FileUpload;
use App\Models\Jemaat;

class BaptisanAirForm
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
                        $prefix = "BA-{$year}";
                        $lastRecord = \App\Models\BaptisanAir::where('nomer_kartu', 'like', "{$prefix}-%")
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
                Select::make('nomer_jemaat')
                    ->label('Nomer Jemaat')
                    ->options(function () {
                        return Jemaat::all()->mapWithKeys(function ($jemaat) {
                            return [$jemaat->id => $jemaat->id . ' - ' . $jemaat->nama];
                        });
                    })
                    ->searchable()
                    ->nullable(),
                TextInput::make('nama')
                    ->label('Nama')
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
                DatePicker::make('tanggal_baptis')
                    ->label('Tanggal Baptis')
                    ->required(),
                FileUpload::make('foto')
                    ->label('Foto')
                    ->image()
                    ->directory('baptisan-air')
                    ->columnSpanFull(),
            ]);
    }
}
