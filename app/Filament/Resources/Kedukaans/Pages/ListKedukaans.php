<?php

namespace App\Filament\Resources\Kedukaans\Pages;

use App\Filament\Resources\Kedukaans\KedukaanResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListKedukaans extends ListRecords
{
    protected static string $resource = KedukaanResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
