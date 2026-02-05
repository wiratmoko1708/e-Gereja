<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('kedukaans', function (Blueprint $table) {
            $table->id();
            $table->string('nomer_surat')->unique();
            $table->string('nomer_jemaat')->nullable();
            $table->string('nama');
            $table->text('alamat');
            $table->string('kota');
            $table->string('jenis_kelamin');
            $table->string('tempat_lahir');
            $table->date('tanggal_lahir');
            $table->date('tanggal_kematian');
            $table->string('tempat_pemakaman');
            $table->date('tanggal_pemakaman');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('kedukaans');
    }
};
