<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class JadwalIbadah extends Model
{
    protected $fillable = [
        'nama_ibadah',
        'hari',
        'waktu_mulai',
        'lokasi',
    ];

    public function daftarPelayanans()
    {
        return $this->hasMany(DaftarPelayanan::class);
    }
}
