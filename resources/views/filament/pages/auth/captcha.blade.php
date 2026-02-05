<x-filament-forms::field-wrapper :field="$field">
    <div class="flex flex-col gap-2">
        <div class="flex items-center gap-2">
            <img src="{{ captcha_src('flat') }}" alt="captcha" class="rounded-lg h-12" id="captcha-image">
            <button type="button" 
                onclick="document.getElementById('captcha-image').src = '{{ captcha_src('flat') }}' + Math.random()"
                class="p-2 text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200"
                style="width: 2.5rem; height: 2.5rem;"
                title="Reload Captcha">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" style="width: 1.25rem; height: 1.25rem;">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M16.023 9.348h4.992v-.001M2.985 19.644v-4.992m0 0h4.992m-4.993 0 3.181 3.183a8.25 8.25 0 0 0 13.803-3.7M4.031 9.865a8.25 8.25 0 0 1 13.803-3.7l3.181 3.182m0-4.991v4.99" />
                </svg>
            </button>
        </div>
        
        <x-filament::input.wrapper>
            <x-filament::input
                type="text"
                wire:model="{{ $getStatePath() }}"
                placeholder="Masukkan kode captcha"
            />
        </x-filament::input.wrapper>
    </div>
</x-filament-forms::field-wrapper>
