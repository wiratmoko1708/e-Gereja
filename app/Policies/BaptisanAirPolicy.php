<?php

namespace App\Policies;

use App\Models\BaptisanAir;
use App\Models\User;

class BaptisanAirPolicy extends BasePolicy
{
    public function viewAny(User $user): bool { return $user->hasRole('Operator'); }
    public function view(User $user, BaptisanAir $model): bool { return $user->hasRole('Operator'); }
    public function create(User $user): bool { return $user->hasRole('Operator'); }
    public function update(User $user, BaptisanAir $model): bool { return $user->hasRole('Operator'); }
    public function delete(User $user, BaptisanAir $model): bool { return $user->hasRole('Operator'); }
}
