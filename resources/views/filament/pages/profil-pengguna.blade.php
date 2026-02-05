<x-filament-panels::page>
    <div class="p-6 bg-white shadow rounded-lg dark:bg-gray-800">
        <h2 class="text-xl font-bold mb-4 text-gray-800 dark:text-white">Informasi Akun Anda</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div class="p-4 border rounded-lg dark:border-gray-600">
                <label class="font-semibold block text-sm text-gray-500 dark:text-gray-400 mb-1">Nama Lengkap</label>
                <p class="text-lg font-medium text-gray-900 dark:text-white">{{ auth()->user()->name }}</p>
            </div>
            <div class="p-4 border rounded-lg dark:border-gray-600">
                <label class="font-semibold block text-sm text-gray-500 dark:text-gray-400 mb-1">Alamat Email</label>
                <p class="text-lg font-medium text-gray-900 dark:text-white">{{ auth()->user()->email }}</p>
            </div>
            <div class="p-4 border rounded-lg dark:border-gray-600">
                <label class="font-semibold block text-sm text-gray-500 dark:text-gray-400 mb-1">Bergabung Sejak</label>
                <p class="text-lg font-medium text-gray-900 dark:text-white">{{ auth()->user()->created_at->format('d F Y') }}</p>
            </div>
        </div>
    </div>
</x-filament-panels::page>
