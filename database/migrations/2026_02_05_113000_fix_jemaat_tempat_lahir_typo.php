<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Check if the column with space exists and the correct one does not
        if (Schema::hasColumn('jemaats', ' tempat_lahir') && !Schema::hasColumn('jemaats', 'tempat_lahir')) {
           // We use raw statement to be safe with the space in column name
            DB::statement('ALTER TABLE jemaats CHANGE COLUMN ` tempat_lahir` `tempat_lahir` VARCHAR(255) NULL');
        } 
        // Fallback: if existing migration was fixed manually or something else happened, 
        // ensure the column exists.
        elseif (!Schema::hasColumn('jemaats', 'tempat_lahir')) {
            Schema::table('jemaats', function (Blueprint $table) {
                $table->string('tempat_lahir')->nullable();
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        if (Schema::hasColumn('jemaats', 'tempat_lahir')) {
            DB::statement('ALTER TABLE jemaats CHANGE COLUMN `tempat_lahir` ` tempat_lahir` VARCHAR(255) NULL');
        }
    }
};
