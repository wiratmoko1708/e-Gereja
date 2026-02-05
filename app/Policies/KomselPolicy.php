<?php

namespace App\Policies;

use App\Models\Komsel;
use App\Models\User;

class KomselPolicy extends BasePolicy
{
    public function viewAny(User $user): bool
    {
        return $user->hasRole('Operator');
    }

    public function view(User $user, Komsel $komsel): bool
    {
        return $user->hasRole('Operator');
    }

    public function create(User $user): bool
    {
        return $user->hasRole('Operator');
    }

    public function update(User $user, Komsel $komsel): bool
    {
        return $user->hasRole('Operator');
    }

    public function delete(User $user, Komsel $komsel): bool
    {
        return $user->hasRole('Operator');
    }
}
