<?php

namespace App\Filament\Pages\Auth;

use Filament\Schemas\Components\Component;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\ViewField;
use Filament\Auth\Pages\Login as BaseLogin;
use Filament\Schemas\Schema;
use Illuminate\Validation\ValidationException;

class Login extends BaseLogin
{
    public function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                $this->getEmailFormComponent(),
                $this->getPasswordFormComponent(),
                $this->getRememberFormComponent(),
                $this->getCaptchaFormComponent(),
            ]);
    }

    protected function getCaptchaFormComponent(): Component
    {
        return ViewField::make('captcha')
            ->view('filament.pages.auth.captcha')
            ->rules(['required', 'captcha'])
            ->validationMessages([
                'captcha' => 'Kode captcha salah atau kadaluarsa.',
                'required' => 'Kode captcha harus diisi.',
            ]);
    }

    protected function throwFailureValidationException(): never
    {
        throw ValidationException::withMessages([
            'data.email' => __('filament-panels::pages/auth/login.messages.failed'),
        ]);
    }
}
