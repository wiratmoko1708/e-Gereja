<?php

namespace App\Filament\Resources\ProfilGerejas\Pages;

use App\Filament\Resources\ProfilGerejas\ProfilGerejaResource;
use Filament\Actions\DeleteAction;
use Filament\Resources\Pages\EditRecord;

class EditProfilGereja extends EditRecord
{
    protected static string $resource = ProfilGerejaResource::class;

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
        ];
    }
}
