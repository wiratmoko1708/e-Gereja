<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('profil_gerejas', function (Blueprint $table) {
            $table->id();
            $table->string('nama_gereja');
            $table->text('alamat');
            $table->string('kota');
            $table->string('telepon');
            $table->string('email');
            $table->string('website')->nullable();
            $table->string('nama_gembala');
            $table->string('logo')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('profil_gerejas');
    }
};
