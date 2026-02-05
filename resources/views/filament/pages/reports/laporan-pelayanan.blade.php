<x-filament-panels::page>
    <div class="space-y-6">
        <div class="rounded-lg bg-white p-6 shadow dark:bg-gray-800">
            <h2 class="text-lg font-semibold text-gray-900 dark:text-white">Laporan Jemaat Berdasarkan Pelayanan/Talenta</h2>
            <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">
                Tampilkan daftar jemaat berdasarkan talenta atau jenis pelayanan. Gunakan filter untuk memilih talenta tertentu.
            </p>
        </div>

        {{ $this->table }}
    </div>
</x-filament-panels::page>
