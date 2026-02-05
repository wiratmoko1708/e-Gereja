<?php

namespace App\Filament\Resources\Pernikahans\Pages;

use App\Filament\Resources\Pernikahans\PernikahanResource;
use Filament\Actions\DeleteAction;
use Filament\Resources\Pages\EditRecord;

class EditPernikahan extends EditRecord
{
    protected static string $resource = PernikahanResource::class;

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
        ];
    }
}
