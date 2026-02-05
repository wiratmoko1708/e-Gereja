<?php

namespace App\Filament\Resources\Kedukaans\Schemas;

use Filament\Schemas\Schema;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use App\Models\Jemaat;

class KedukaanForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('nomer_surat')
                    ->label('Nomer Surat')
                    ->required()
                    ->unique(ignoreRecord: true)
                    ->default(function () {
                        $year = date('Y');
                        $prefix = "DU-{$year}";
                        $lastRecord = \App\Models\Kedukaan::where('nomer_surat', 'like', "{$prefix}-%")
                            ->orderBy('id', 'desc')
                            ->first();

                        if ($lastRecord) {
                            $lastNumber = intval(substr($lastRecord->nomer_surat, -4));
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
                Textarea::make('alamat')
                    ->label('Alamat')
                    ->required()
                    ->columnSpanFull(),
                TextInput::make('kota')
                    ->label('Kota')
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
                DatePicker::make('tanggal_kematian')
                    ->label('Tanggal Kematian')
                    ->required(),
                TextInput::make('tempat_pemakaman')
                    ->label('Tempat Pemakaman')
                    ->required(),
                DatePicker::make('tanggal_pemakaman')
                    ->label('Tanggal Pemakaman')
                    ->required(),
            ]);
    }
}
