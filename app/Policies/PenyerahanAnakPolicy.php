<?php

namespace App\Policies;

use App\Models\PenyerahanAnak;
use App\Models\User;

class PenyerahanAnakPolicy extends BasePolicy
{
    public function viewAny(User $user): bool { return $user->hasRole('Operator'); }
    public function view(User $user, PenyerahanAnak $model): bool { return $user->hasRole('Operator'); }
    public function create(User $user): bool { return $user->hasRole('Operator'); }
    public function update(User $user, PenyerahanAnak $model): bool { return $user->hasRole('Operator'); }
    public function delete(User $user, PenyerahanAnak $model): bool { return $user->hasRole('Operator'); }
}
