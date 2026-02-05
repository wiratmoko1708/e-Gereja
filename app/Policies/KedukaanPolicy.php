<?php

namespace App\Policies;

use App\Models\Kedukaan;
use App\Models\User;

class KedukaanPolicy extends BasePolicy
{
    public function viewAny(User $user): bool { return $user->hasRole('Operator'); }
    public function view(User $user, Kedukaan $model): bool { return $user->hasRole('Operator'); }
    public function create(User $user): bool { return $user->hasRole('Operator'); }
    public function update(User $user, Kedukaan $model): bool { return $user->hasRole('Operator'); }
    public function delete(User $user, Kedukaan $model): bool { return $user->hasRole('Operator'); }
}
