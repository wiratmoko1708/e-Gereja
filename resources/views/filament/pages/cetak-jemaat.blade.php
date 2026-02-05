<x-filament-panels::page>
    <div class="space-y-6">
        <!-- Header Info -->
        <div class="rounded-lg bg-white p-6 shadow dark:bg-gray-800 print:shadow-none">
            <div class="flex items-center justify-between">
                <div>
                    <h2 class="text-lg font-semibold text-gray-900 dark:text-white">Cetak Data Jemaat</h2>
                    <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">
                        Klik tombol cetak untuk mencetak seluruh data jemaat.
                    </p>
                </div>
                <button 
                    onclick="window.print()" 
                    class="inline-flex items-center gap-2 rounded-lg bg-primary-600 px-4 py-2 text-sm font-semibold text-white shadow-sm hover:bg-primary-700 print:hidden"
                >
                    <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M6.72 13.829c-.24.03-.48.062-.72.096m.72-.096a42.415 42.415 0 0110.56 0m-10.56 0L6.34 18m10.94-4.171c.24.03.48.062.72.096m-.72-.096L17.66 18m0 0l.229 2.523a1.125 1.125 0 01-1.12 1.227H7.231c-.662 0-1.18-.568-1.12-1.227L6.34 18m11.318 0h1.091A2.25 2.25 0 0021 15.75V9.456c0-1.081-.768-2.015-1.837-2.175a48.055 48.055 0 00-1.913-.247M6.34 18H5.25A2.25 2.25 0 013 15.75V9.456c0-1.081.768-2.015 1.837-2.175a48.041 48.041 0 011.913-.247m10.5 0a48.536 48.536 0 00-10.5 0m10.5 0V3.375c0-.621-.504-1.125-1.125-1.125h-8.25c-.621 0-1.125.504-1.125 1.125v3.659M18 10.5h.008v.008H18V10.5zm-3 0h.008v.008H15V10.5z" />
                    </svg>
                    Cetak Data
                </button>
            </div>
        </div>

        <!-- Print Content -->
        <div class="rounded-lg bg-white shadow dark:bg-gray-800 print:shadow-none print:bg-white">
            <!-- Print Header (shown only when printing) -->
            <div class="hidden print:block border-b-2 border-gray-800 pb-4 mb-6">
                <h1 class="text-center text-2xl font-bold text-gray-900">DATA JEMAAT</h1>
                <p class="text-center text-sm text-gray-600 mt-2">
                    Dicetak pada: {{ now()->format('d F Y, H:i') }} WIB
                </p>
            </div>

            <!-- Data Table -->
            <div class="overflow-x-auto">
                <table class="min-w-full divide-y divide-gray-200 dark:divide-gray-700 print:text-xs">
                    <thead class="bg-gray-50 dark:bg-gray-900 print:bg-gray-100">
                        <tr>
                            <th scope="col" class="px-3 py-3 text-left text-xs font-semibold text-gray-900 dark:text-white uppercase tracking-wider print:border print:border-gray-400">
                                No
                            </th>
                            <th scope="col" class="px-3 py-3 text-left text-xs font-semibold text-gray-900 dark:text-white uppercase tracking-wider print:border print:border-gray-400">
                                Nama Lengkap
                            </th>
                            <th scope="col" class="px-3 py-3 text-left text-xs font-semibold text-gray-900 dark:text-white uppercase tracking-wider print:border print:border-gray-400">
                                L/P
                            </th>
                            <th scope="col" class="px-3 py-3 text-left text-xs font-semibold text-gray-900 dark:text-white uppercase tracking-wider print:border print:border-gray-400">
                                Tanggal Lahir
                            </th>
                            <th scope="col" class="px-3 py-3 text-left text-xs font-semibold text-gray-900 dark:text-white uppercase tracking-wider print:border print:border-gray-400">
                                Alamat
                            </th>
                            <th scope="col" class="px-3 py-3 text-left text-xs font-semibold text-gray-900 dark:text-white uppercase tracking-wider print:border print:border-gray-400">
                                No. Telepon
                            </th>
                            <th scope="col" class="px-3 py-3 text-left text-xs font-semibold text-gray-900 dark:text-white uppercase tracking-wider print:border print:border-gray-400">
                                Komsel
                            </th>
                            <th scope="col" class="px-3 py-3 text-left text-xs font-semibold text-gray-900 dark:text-white uppercase tracking-wider print:border print:border-gray-400 print:hidden">
                                Status
                            </th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200 dark:bg-gray-800 dark:divide-gray-700 print:bg-white print:divide-gray-300">
                        @foreach ($this->getJemaatData() as $index => $jemaat)
                            <tr class="hover:bg-gray-50 dark:hover:bg-gray-700 print:hover:bg-white">
                                <td class="px-3 py-4 whitespace-nowrap text-sm text-gray-900 dark:text-gray-300 print:text-black print:border print:border-gray-400 print:py-2">
                                    {{ $index + 1 }}
                                </td>
                                <td class="px-3 py-4 whitespace-nowrap text-sm font-medium text-gray-900 dark:text-white print:text-black print:border print:border-gray-400 print:py-2">
                                    {{ $jemaat->nama }}
                                </td>
                                <td class="px-3 py-4 whitespace-nowrap text-sm text-gray-900 dark:text-gray-300 print:text-black print:border print:border-gray-400 print:py-2">
                                    {{ $jemaat->jenis_kelamin }}
                                </td>
                                <td class="px-3 py-4 whitespace-nowrap text-sm text-gray-900 dark:text-gray-300 print:text-black print:border print:border-gray-400 print:py-2">
                                    {{ $jemaat->tanggal_lahir ? $jemaat->tanggal_lahir->format('d/m/Y') : '-' }}
                                </td>
                                <td class="px-3 py-4 text-sm text-gray-900 dark:text-gray-300 print:text-black print:border print:border-gray-400 print:py-2">
                                    {{ Str::limit($jemaat->alamat, 50) ?? '-' }}
                                </td>
                                <td class="px-3 py-4 whitespace-nowrap text-sm text-gray-900 dark:text-gray-300 print:text-black print:border print:border-gray-400 print:py-2">
                                    {{ $jemaat->no_telepon ?? '-' }}
                                </td>
                                <td class="px-3 py-4 whitespace-nowrap text-sm text-gray-900 dark:text-gray-300 print:text-black print:border print:border-gray-400 print:py-2">
                                    {{ $jemaat->komsel->nama_komsel ?? '-' }}
                                </td>
                                <td class="px-3 py-4 whitespace-nowrap text-sm print:hidden">
                                    <span class="inline-flex rounded-full px-2 text-xs font-semibold leading-5 
                                        {{ $jemaat->status_pernikahan === 'Menikah' ? 'bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200' : 'bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200' }}">
                                        {{ $jemaat->status_pernikahan ?? 'Belum Diisi' }}
                                    </span>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>

            <!-- Print Footer (shown only when printing) -->
            <div class="hidden print:block mt-8 pt-4 border-t-2 border-gray-300">
                <p class="text-xs text-gray-600 text-center">
                    Total: {{ $this->getJemaatData()->count() }} jemaat
                </p>
            </div>
        </div>
    </div>

    <style>
        @media print {
            @page {
                size: A4 landscape;
                margin: 1cm;
            }

            body {
                print-color-adjust: exact;
                -webkit-print-color-adjust: exact;
            }

            /* Hide Filament navigation and other UI elements */
            nav, 
            aside,
            .fi-topbar,
            [data-slot='sidebar'],
            [role='banner'] {
                display: none !important;
            }

            /* Adjust main content for printing */
            main {
                margin: 0 !important;
                padding: 0 !important;
            }

            /* Ensure table doesn't break across pages awkwardly */
            table {
                page-break-inside: auto;
            }

            tr {
                page-break-inside: avoid;
                page-break-after: auto;
            }

            thead {
                display: table-header-group;
            }

            tfoot {
                display: table-footer-group;
            }
        }
    </style>
</x-filament-panels::page>
