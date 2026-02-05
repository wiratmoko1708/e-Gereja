<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('penyerahan_anaks', function (Blueprint $table) {
            $table->id();
            $table->string('nomer_kartu')->unique();
            $table->string('nama_anak');
            $table->string('jenis_kelamin');
            $table->string('tempat_lahir');
            $table->date('tanggal_lahir');
            $table->string('nama_ayah');
            $table->string('nama_ibu');
            $table->text('alamat');
            $table->date('tanggal_penyerahan');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('penyerahan_anaks');
    }
};
