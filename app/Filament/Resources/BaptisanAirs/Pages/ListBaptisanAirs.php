<?php

namespace App\Filament\Resources\BaptisanAirs\Pages;

use App\Filament\Resources\BaptisanAirs\BaptisanAirResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListBaptisanAirs extends ListRecords
{
    protected static string $resource = BaptisanAirResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
