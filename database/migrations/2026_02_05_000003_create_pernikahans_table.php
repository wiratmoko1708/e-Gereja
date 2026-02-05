<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('pernikahans', function (Blueprint $table) {
            $table->id();
            $table->string('nomer_pernikahan')->unique();
            $table->string('nama_pria');
            $table->string('tempat_lahir_pria');
            $table->date('tanggal_lahir_pria');
            $table->string('nomer_hp_pria');
            $table->string('nama_wanita');
            $table->string('tempat_lahir_wanita');
            $table->date('tanggal_lahir_wanita');
            $table->string('nomer_hp_wanita');
            $table->string('foto')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('pernikahans');
    }
};
