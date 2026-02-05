<?php

namespace App\Filament\Resources\Kedukaans\Pages;

use App\Filament\Resources\Kedukaans\KedukaanResource;
use Filament\Actions\DeleteAction;
use Filament\Resources\Pages\EditRecord;

class EditKedukaan extends EditRecord
{
    protected static string $resource = KedukaanResource::class;

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
        ];
    }
}
