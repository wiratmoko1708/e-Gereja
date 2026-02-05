<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Komsel extends Model
{
    protected $fillable = [
        'nama_komsel',
        'alamat',
        'ketua_komsel',
        'jadwal_komsel',
    ];

    public function jemaats()
    {
        return $this->hasMany(Jemaat::class);
    }
}
