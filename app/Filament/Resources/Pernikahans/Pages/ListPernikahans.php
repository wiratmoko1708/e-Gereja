<?php

namespace App\Filament\Resources\Pernikahans\Pages;

use App\Filament\Resources\Pernikahans\PernikahanResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListPernikahans extends ListRecords
{
    protected static string $resource = PernikahanResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
