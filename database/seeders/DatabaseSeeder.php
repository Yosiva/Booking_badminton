<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Enums\UserRolesEnum;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

        // run location seeder
        $this->call([
            LocationSeeder::class,
        ]);

        $userroles = [
            [
                'id' => UserRolesEnum::Customer,
                'name' => 'Customer',
                'status' => true,
            ],
            [
                'id' => UserRolesEnum::Employee,
                'name' => 'Employee',
                'status' => true,
            ],
            [
                'id' => UserRolesEnum::Admin,
                'name' => 'Admin',
                'status' => true,
            ]

        ];

        foreach ($userroles as $role) {
            \App\Models\Role::create($role);
        }

        // Create admin user
        \App\Models\User::create([
            'name' => 'Yos ivan',
            'email' => 'ivan@gmail.com',
            'password' => Hash::make('password'),
            'phone_number' => '1234569990',
            'role_id' => UserRolesEnum::Admin,
        ]);

        // create mock customers
        \App\Models\User::create([
            'name' => 'yos',
            'email' => 'yos@gmail.com',
            'password' => Hash::make('yos1234'),
            'phone_number' => '1299567890',
            'role_id' => UserRolesEnum::Customer,
        ]);

        \App\Models\User::create([
            'name' => 'tus',
            'email' => 'kita@gmail.com',
            'password' => Hash::make('kita123'),
            'phone_number' => '1277567890',
            'role_id' => UserRolesEnum::Customer,
        ]);

        \App\Models\User::create([
            'name' => 'vanbok',
            'email' => 'van@gmail.com',
            'password' => Hash::make('van12234'),
            'phone_number' => '1234998890',
            'role_id' => UserRolesEnum::Customer,
        ]);




        // create mock employees
        \App\Models\User::create([
            'name' => 'ivan',
            'email' => 'ivan1@gmail.com',
            'password' => Hash::make('kita'),
            'phone_number' => '1644567890',
            'role_id' => UserRolesEnum::Employee,
        ]);

        \App\Models\User::create([
            'name' => 'Employee 2',
            'email' => 'emp2@gmails.com',
            'password' => Hash::make('emppassword'),
            'phone_number' => '1234523890',
            'role_id' => UserRolesEnum::Employee,
        ]);

        // this Employee is suspeneded
        \App\Models\User::create([
            'name' => 'Employee 3',
            'email' => 'emp3@gmail.com',
            'password' => Hash::make('emppassword'),
            'phone_number' => '0034567890',
            'role_id' => UserRolesEnum::Employee,
            'status' => '0',
        ]);

        // Deals
        \App\Models\Deal::create([
            'name' => 'Deal 1',
            'description' => 'Deal 1 description',
            'start_date' => '2023-07-16',
            'end_date' => '2023-07-20',
            'discount' => '10',
            'is_hidden' => '0',
        ]);

        // categories Skin, Makeup, Nails, Hair
        \App\Models\Category::create([
            'name' => 'Lapangan satu',
        ]);

        \App\Models\Category::create([
            'name' => 'Lapangan dua',
        ]);

        \App\Models\Category::create([
            'name' => 'Lapangan tiga',
        ]);

        \App\Models\Category::create([
            'name' => 'Lapangan empat',
        ]);

        $this->call([
            ServicesSeeder::class,
            TimeSlotSeeder::class,
        ]);


    }
}
