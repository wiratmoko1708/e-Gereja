@php
    $profil = \App\Models\ProfilGereja::first();
@endphp

@if($profil && $profil->logo)
    <div class="flex items-center gap-x-2" style="display: flex !important; align-items: center !important; gap: 0.5rem !important;">
        <img src="{{ Storage::disk('public')->url($profil->logo) }}" alt="Logo" class="h-10 w-auto" style="height: 3rem;">
        <span class="text-xl font-bold tracking-tight text-white dark:text-white">
            {{ $profil->nama_gereja ?? config('app.name') }}
        </span>
    </div>
@else
    <div class="text-xl font-bold tracking-tight text-gray-950 dark:text-white">
        {{ config('app.name') }}
    </div>
@endif
