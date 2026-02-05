<?php

namespace App\Filament\Pages;

use BackedEnum;
use UnitEnum;
use Filament\Pages\Page;

class ProfilPengguna extends Page
{
    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-user-circle';

    protected static string|UnitEnum|null $navigationGroup = 'Pengaturan';

    protected static ?string $navigationLabel = 'Profil Pengguna';

    protected static ?string $title = 'Profil Pengguna';

    protected string $view = 'filament.pages.profil-pengguna';
}
