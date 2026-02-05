<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProfilGereja extends Model
{
    protected $fillable = [
        'nama_gereja',
        'alamat',
        'kota',
        'telepon',
        'email',
        'website',
        'nama_gembala',
        'logo',
    ];
}
