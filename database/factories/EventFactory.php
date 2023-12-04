<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class EventFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'event_name' => $this->faker->name(),
            'date' => $this->faker->name(),
            'time' => $this->faker->name(),
            'location' => $this->faker->name(),
            'description' => $this->faker->sentence(),
            'category' => $this->faker->name(),
            't1_name' => $this->faker->name(),
            't1_price' => $this->faker->price,
            't1_count' => $this->faker->name(),
            't1_sold' => $this->faker->name(),
            't2_name' => $this->faker->name(),
            't2_price' => $this->faker->price,
            't2_count' => $this->faker->name(),
            't2_sold' => $this->faker->name(),
            't3_name' => $this->faker->name(),
            't3_price' => $this->faker->price,
            't3_count' => $this->faker->name(),
            't3_sold' => $this->faker->name(),
            'photo_path' => $this->faker->name(),
        ];
    }
}
