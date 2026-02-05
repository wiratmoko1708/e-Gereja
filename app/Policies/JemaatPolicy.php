<?php

namespace App\Policies;

use App\Models\Jemaat;
use App\Models\User;

class JemaatPolicy extends BasePolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        return $user->hasRole('Operator');
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, Jemaat $jemaat): bool
    {
        return $user->hasRole('Operator');
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        return $user->hasRole('Operator');
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, Jemaat $jemaat): bool
    {
        return $user->hasRole('Operator');
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, Jemaat $jemaat): bool
    {
        return $user->hasRole('Operator');
    }
}
