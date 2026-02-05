<?php

namespace App\Policies;

use App\Models\DaftarPelayanan;
use App\Models\User;

class DaftarPelayananPolicy extends BasePolicy
{
    public function viewAny(User $user): bool { return $user->hasRole('Operator'); }
    public function view(User $user, DaftarPelayanan $model): bool { return $user->hasRole('Operator'); }
    public function create(User $user): bool { return $user->hasRole('Operator'); }
    public function update(User $user, DaftarPelayanan $model): bool { return $user->hasRole('Operator'); }
    public function delete(User $user, DaftarPelayanan $model): bool { return $user->hasRole('Operator'); }
}
