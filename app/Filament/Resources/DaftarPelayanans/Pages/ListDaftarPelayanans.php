<?php

namespace App\Filament\Resources\DaftarPelayanans\Pages;

use App\Filament\Resources\DaftarPelayanans\DaftarPelayananResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListDaftarPelayanans extends ListRecords
{
    protected static string $resource = DaftarPelayananResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
