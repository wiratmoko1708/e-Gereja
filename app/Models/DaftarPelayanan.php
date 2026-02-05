<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DaftarPelayanan extends Model
{
    protected $fillable = [
        'jadwal_ibadah_id',
        'jemaat_id',
        'talenta_id',
        'tanggal',
        'keterangan',
    ];

    public function jadwalIbadah()
    {
        return $this->belongsTo(JadwalIbadah::class);
    }

    public function jemaat()
    {
        return $this->belongsTo(Jemaat::class);
    }

    public function talenta()
    {
        return $this->belongsTo(Talenta::class);
    }
}
