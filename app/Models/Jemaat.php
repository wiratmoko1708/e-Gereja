<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use Carbon\Carbon;

class Jemaat extends Model
{
    protected $fillable = [
        'nama',
        'tempat_lahir',
        'tanggal_lahir',
        'jenis_kelamin',
        'alamat',
        'no_telepon',
        'email',
        'status_pernikahan',
        'pekerjaan',
        'komsel_id',
    ];

    protected $casts = [
        'tanggal_lahir' => 'date',
    ];

    // Relationships
    public function komsel()
    {
        return $this->belongsTo(Komsel::class);
    }

    public function daftarPelayanans()
    {
        return $this->hasMany(DaftarPelayanan::class);
    }

    // Accessors
    public function getUsiaAttribute()
    {
        if (!$this->tanggal_lahir) {
            return null;
        }
        return Carbon::parse($this->tanggal_lahir)->age;
    }

    public function getBulanLahirAttribute()
    {
        if (!$this->tanggal_lahir) {
            return null;
        }
        return Carbon::parse($this->tanggal_lahir)->month;
    }

    // Query Scopes
    public function scopeByBulanLahir(Builder $query, int $bulan)
    {
        return $query->whereMonth('tanggal_lahir', $bulan);
    }

    public function scopeByRentangUsia(Builder $query, int $min, int $max = null)
    {
        $now = Carbon::now();
        
        if ($max) {
            return $query->whereBetween('tanggal_lahir', [
                $now->copy()->subYears($max)->startOfDay(),
                $now->copy()->subYears($min)->endOfDay()
            ]);
        }
        
        return $query->where('tanggal_lahir', '<=', $now->copy()->subYears($min)->endOfDay());
    }

    public function scopeByJenisKelamin(Builder $query, string $jenisKelamin)
    {
        return $query->where('jenis_kelamin', $jenisKelamin);
    }

    public function scopeByStatusPernikahan(Builder $query, string $status)
    {
        return $query->where('status_pernikahan', $status);
    }

    public function scopeByKomsel(Builder $query, int $komselId)
    {
        return $query->where('komsel_id', $komselId);
    }
}
