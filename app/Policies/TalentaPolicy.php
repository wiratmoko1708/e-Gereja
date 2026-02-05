<?php

namespace App\Policies;

use App\Models\Talenta;
use App\Models\User;

class TalentaPolicy extends BasePolicy
{
    public function viewAny(User $user): bool { return $user->hasRole('Operator'); }
    public function view(User $user, Talenta $model): bool { return $user->hasRole('Operator'); }
    public function create(User $user): bool { return $user->hasRole('Operator'); }
    public function update(User $user, Talenta $model): bool { return $user->hasRole('Operator'); }
    public function delete(User $user, Talenta $model): bool { return $user->hasRole('Operator'); }
}
