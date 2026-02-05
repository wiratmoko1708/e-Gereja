<?php

namespace App\Filament\Resources\PenyerahanAnaks\Pages;

use App\Filament\Resources\PenyerahanAnaks\PenyerahanAnakResource;
use Filament\Actions\DeleteAction;
use Filament\Resources\Pages\EditRecord;

class EditPenyerahanAnak extends EditRecord
{
    protected static string $resource = PenyerahanAnakResource::class;

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
        ];
    }
}
