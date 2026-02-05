<?php

namespace App\Filament\Resources\ProfilGerejas\Pages;

use App\Filament\Resources\ProfilGerejas\ProfilGerejaResource;
use App\Filament\Exports\ProfilGerejaExporter;
use Filament\Actions\CreateAction;
use Filament\Actions\ExportAction;
use Filament\Resources\Pages\ListRecords;

class ListProfilGerejas extends ListRecords
{
    protected static string $resource = ProfilGerejaResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
            ExportAction::make()->exporter(ProfilGerejaExporter::class)->label('Export'),
        ];
    }
}
