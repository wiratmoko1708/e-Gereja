<?php

namespace App\Filament\Resources\Komsels\Pages;

use App\Filament\Resources\Komsels\KomselResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListKomsels extends ListRecords
{
    protected static string $resource = KomselResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
