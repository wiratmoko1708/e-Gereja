<?php

namespace App\Policies;

use App\Models\JadwalIbadah;
use App\Models\User;

class JadwalIbadahPolicy extends BasePolicy
{
    public function viewAny(User $user): bool { return $user->hasRole('Operator'); }
    public function view(User $user, JadwalIbadah $model): bool { return $user->hasRole('Operator'); }
    public function create(User $user): bool { return $user->hasRole('Operator'); }
    public function update(User $user, JadwalIbadah $model): bool { return $user->hasRole('Operator'); }
    public function delete(User $user, JadwalIbadah $model): bool { return $user->hasRole('Operator'); }
}
