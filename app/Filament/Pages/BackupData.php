<?php

namespace App\Filament\Pages;

use BackedEnum;
use UnitEnum;
use Filament\Notifications\Notification;
use Filament\Pages\Page;
use Illuminate\Support\Facades\Artisan;

class BackupData extends Page
{
    public static function canAccess(): bool
    {
        return auth()->user()?->hasRole('Admin') ?? false;
    }
    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-server-stack';

    protected static string|UnitEnum|null $navigationGroup = 'Pengaturan';

    protected static ?string $navigationLabel = 'Backup Data';

    protected static ?string $title = 'Backup Data';

    protected string $view = 'filament.pages.backup-data';

    public function backup()
    {
        // Dalam implementasi nyata, ini akan memanggil 'php artisan backup:run'
        // Artisan::call('backup:run');
        
        Notification::make()
            ->title('Backup Berhasil')
            ->body('Data telah berhasil di-backup (Simulasi).')
            ->success()
            ->send();
    }
}
