<?php

namespace App\Policies;

use App\Models\ProfilGereja;
use App\Models\User;

class ProfilGerejaPolicy extends BasePolicy
{
    public function viewAny(User $user): bool
    {
        return false;
    }

    public function view(User $user, ProfilGereja $model): bool
    {
        return false;
    }

    public function create(User $user): bool
    {
        return false;
    }

    public function update(User $user, ProfilGereja $model): bool
    {
        return false;
    }

    public function delete(User $user, ProfilGereja $model): bool
    {
        return false;
    }
}
