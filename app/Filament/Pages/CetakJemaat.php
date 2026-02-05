<?php

namespace App\Filament\Pages;

use App\Models\Jemaat;
use Filament\Pages\Page;
use UnitEnum;
use BackedEnum;

class CetakJemaat extends Page
{
    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-printer';

    protected string $view = 'filament.pages.cetak-jemaat';

    protected static string|UnitEnum|null $navigationGroup = 'Laporan';

    protected static ?string $navigationLabel = 'Cetak Jemaat';

    protected static ?string $title = 'Cetak Data Jemaat';

    protected static ?int $navigationSort = 10;

    public function getJemaatData()
    {
        return Jemaat::with('komsel')
            ->orderBy('nama')
            ->get();
    }
}
