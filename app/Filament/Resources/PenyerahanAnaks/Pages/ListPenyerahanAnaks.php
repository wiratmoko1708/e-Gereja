<?php

namespace App\Filament\Resources\PenyerahanAnaks\Pages;

use App\Filament\Resources\PenyerahanAnaks\PenyerahanAnakResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListPenyerahanAnaks extends ListRecords
{
    protected static string $resource = PenyerahanAnakResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
