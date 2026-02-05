<?php

use Illuminate\Support\Facades\Route;

Route::redirect('/', '/faith/login');

use App\Http\Controllers\CetakController;

Route::middleware(['auth'])->group(function () {
    Route::get('/faith/cetak/jadwal-ibadah', [CetakController::class, 'jadwalIbadah'])->name('cetak.jadwal-ibadah');
    Route::get('/faith/cetak/jemaat', [CetakController::class, 'jemaat'])->name('cetak.jemaat');
    Route::get('/faith/cetak/komsel', [CetakController::class, 'komsel'])->name('cetak.komsel');
    Route::get('/faith/cetak/daftar-pelayanan', [CetakController::class, 'daftarPelayanan'])->name('cetak.daftar-pelayanan');
    Route::get('/faith/cetak/talenta', [CetakController::class, 'talenta'])->name('cetak.talenta');
});

