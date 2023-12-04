<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    use HasFactory;

    protected $table = 'events';
    protected $fillable = [
        'event_name',
        'date',
        'time',
        'location',
        'description',
        'category',
        'approved',
        't1_name',
        't1_price',
        't1_count',
        't1_sold',
        't2_name',
        't2_price',
        't2_count',
        't2_sold',
        't3_name',
        't3_price',
        't3_count',
        't3_sold',
        'photo_path'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function bookings()
    {
        return $this->hasMany(Booking::class);
    }
}
