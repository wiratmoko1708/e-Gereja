<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\User;

class RolesAndPermissionsSeeder extends Seeder
{
    public function run(): void
    {
        // Reset cached roles and permissions
        app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();

        // create roles
        $adminRole = Role::firstOrCreate(['name' => 'Admin']);
        $operatorRole = Role::firstOrCreate(['name' => 'Operator']);

        // Assign Admin role to gembala@gmail.com
        $user = User::where('email', 'gembala@gmail.com')->first();
        if ($user) {
            $user->assignRole($adminRole);
        } else {
            // Create if not exists (optional, but good for testing)
            User::create([
                'name' => 'Gembala',
                'email' => 'gembala@gmail.com',
                'password' => bcrypt('password'), // default password
            ])->assignRole($adminRole);
        }
        
        // Setup Test Operator (Optional, for manual verification)
        $operatorEmail = 'operator@gmail.com';
        $operatorUser = User::where('email', $operatorEmail)->first();
        if (!$operatorUser) {
             User::create([
                'name' => 'Operator Test',
                'email' => $operatorEmail,
                'password' => bcrypt('password'),
            ])->assignRole($operatorRole);
        } else {
             $operatorUser->assignRole($operatorRole);
        }
    }
}
