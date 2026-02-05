<?php

namespace App\Http\Controllers;

use App\Models\JadwalIbadah;
use Illuminate\Http\Request;

class CetakController extends Controller
{
    public function jadwalIbadah()
    {
        $data = JadwalIbadah::all();
        $profil = \App\Models\ProfilGereja::first();

        return view('cetak.jadwal-ibadah', [
            'data' => $data,
            'profil' => $profil,
        ]);
    }

    public function jemaat()
    {
        $data = \App\Models\Jemaat::with('komsel')->get();
        $profil = \App\Models\ProfilGereja::first();

        return view('cetak.jemaat', [
            'data' => $data,
            'profil' => $profil,
        ]);
    }

    public function komsel()
    {
        $data = \App\Models\Komsel::all();
        $profil = \App\Models\ProfilGereja::first();

        return view('cetak.komsel', [
            'data' => $data,
            'profil' => $profil,
        ]);
    }

    public function daftarPelayanan()
    {
        $data = \App\Models\DaftarPelayanan::with(['jadwalIbadah', 'jemaat', 'talenta'])->get();
        $profil = \App\Models\ProfilGereja::first();

        return view('cetak.daftar-pelayanan', [
            'data' => $data,
            'profil' => $profil,
        ]);
    }

    public function talenta()
    {
        $data = \App\Models\Talenta::all();
        $profil = \App\Models\ProfilGereja::first();

        return view('cetak.talenta', [
            'data' => $data,
            'profil' => $profil,
        ]);
    }

    public function jemaatIndividual($id)
    {
        $jemaat = \App\Models\Jemaat::with('komsel')->findOrFail($id);
        $profil = \App\Models\ProfilGereja::first();

        return view('cetak.jemaat-individual', [
            'jemaat' => $jemaat,
            'profil' => $profil,
        ]);
    }
}
