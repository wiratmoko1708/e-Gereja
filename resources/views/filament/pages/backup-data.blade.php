<x-filament-panels::page>
    <div class="p-6 bg-white shadow rounded-lg dark:bg-gray-800">
        <div class="text-center">
            <h2 class="text-xl font-bold mb-4 text-gray-800 dark:text-white">Backup Database</h2>
            <p class="mb-6 text-gray-600 dark:text-gray-300">
                Klik tombol di bawah ini untuk memulai proses backup data database dan file.
                Proses ini mungkin memakan waktu beberapa saat.
            </p>

            <x-filament::button wire:click="backup" size="lg" icon="heroicon-o-arrow-down-tray">
                Mulai Backup Data
            </x-filament::button>
        </div>
    </div>
</x-filament-panels::page>
