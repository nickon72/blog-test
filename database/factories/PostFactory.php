<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Category;
use App\Models\User;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Post>
 */
class PostFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition() {
        return [
            'user_id' => User::pluck('id')[$this->faker->numberBetween(1, User::count())],
            'category_id' => Category::pluck('id')[$this->faker->numberBetween(1, Category::count())],
            'title' => $this->faker->realText(rand(25, 30)),
            'image' => null,
            'content' => $this->faker->realText(rand(200, 300)),
            'status' => 1,
            'views' => $this->faker->numberBetween(0,5000),
            'is_featured' => 0,

        ];
    }
}
