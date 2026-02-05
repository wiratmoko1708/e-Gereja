<?php

namespace App\Traits;

use Illuminate\Support\Facades\Auth;

trait HasOperatorAccess
{
    public static function canAccess(): bool
    {
        $user = Auth::user();

        if (!$user) {
            return false;
        }

        return $user->hasRole('Admin') || $user->hasRole('Operator');
    }
}
