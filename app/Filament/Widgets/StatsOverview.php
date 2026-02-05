<?php

namespace App\Filament\Widgets;

use App\Models\BaptisanAir;
use App\Models\Kedukaan;
use App\Models\PenyerahanAnak;
use App\Models\Pernikahan;
use App\Models\Talenta;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class StatsOverview extends BaseWidget
{
    protected function getStats(): array
    {
        return [
            Stat::make('Baptisan Air', BaptisanAir::count())
                ->description('Total Data Baptisan')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->color('success')
                ->chart([7, 2, 10, 3, 15, 4, 17]),
            Stat::make('Kedukaan', Kedukaan::count())
                ->description('Total Data Kedukaan')
                ->descriptionIcon('heroicon-m-user-minus')
                ->color('danger')
                ->chart([3, 5, 2, 8, 1, 4, 2]),
            Stat::make('Penyerahan Anak', PenyerahanAnak::count())
                ->description('Total Penyerahan Anak')
                ->descriptionIcon('heroicon-m-heart')
                ->color('warning')
                ->chart([1, 4, 3, 5, 2, 8, 6]),
            Stat::make('Pernikahan', Pernikahan::count())
                ->description('Total Pernikahan')
                ->descriptionIcon('heroicon-m-users')
                ->color('primary')
                ->chart([2, 5, 3, 7, 4, 9, 5]),
            Stat::make('Pengguna', \App\Models\User::count())
                ->description('Total Pengguna')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->chart([7, 2, 10, 3, 15, 4, 17])
                ->color('success'),
            Stat::make('Jemaat', \App\Models\Jemaat::count())
                ->description('Total Jemaat')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->chart([7, 2, 10, 3, 15, 4, 17])
                ->color('info'),
            Stat::make('Komsel', \App\Models\Komsel::count())
                ->description('Total Komsel')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->chart([7, 2, 10, 3, 15, 4, 17])
                ->color('warning'),
            Stat::make('Talenta', Talenta::count())
                ->description('Total Talenta')
                ->descriptionIcon('heroicon-m-star')
                ->chart([5, 8, 6, 10, 7, 12, 9])
                ->color('primary'),
        ];
    }
}
