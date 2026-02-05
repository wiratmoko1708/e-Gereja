<?php

namespace App\Filament\Resources\BaptisanAirs\Pages;

use App\Filament\Resources\BaptisanAirs\BaptisanAirResource;
use Filament\Actions\DeleteAction;
use Filament\Resources\Pages\EditRecord;

class EditBaptisanAir extends EditRecord
{
    protected static string $resource = BaptisanAirResource::class;

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
        ];
    }
}
