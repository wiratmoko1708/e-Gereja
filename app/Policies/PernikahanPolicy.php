<?php

namespace App\Policies;

use App\Models\Pernikahan;
use App\Models\User;

class PernikahanPolicy extends BasePolicy
{
    public function viewAny(User $user): bool { return $user->hasRole('Operator'); }
    public function view(User $user, Pernikahan $model): bool { return $user->hasRole('Operator'); }
    public function create(User $user): bool { return $user->hasRole('Operator'); }
    public function update(User $user, Pernikahan $model): bool { return $user->hasRole('Operator'); }
    public function delete(User $user, Pernikahan $model): bool { return $user->hasRole('Operator'); }
}
