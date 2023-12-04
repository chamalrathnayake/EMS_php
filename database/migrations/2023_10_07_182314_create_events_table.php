<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEventsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('events', function (Blueprint $table) {
            $table->id();
            $table->string('event_name');
            $table->string('date');
            $table->string('time');
            $table->string('location');
            $table->string('description');
            $table->string('category');
            $table->integer('approved');
            $table->unsignedInteger('user_id');
            $table->string('t1_name');
            $table->double('t1_price');
            $table->integer('t1_count');
            $table->integer('t1_sold');
            $table->string('t2_name');
            $table->double('t2_price');
            $table->integer('t2_count');
            $table->integer('t2_sold');
            $table->string('t3_name');
            $table->double('t3_price');
            $table->integer('t3_count');
            $table->integer('t3_sold');
            $table->string('photo_path');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('events');
    }
}