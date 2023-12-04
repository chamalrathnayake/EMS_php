<?php

namespace App\Http\Controllers;

use App\Models\Event;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;

class AdminController extends Controller
{
    public function dashboard()
    {
        return view('admin.admin-home');
    }

    public function pendingEvents()
    {
        $eventsData = Event::where('approved', 0)->get();

        $events = [];
        foreach ($eventsData as $event) {
            $user = User::find($event->user_id);
            if ($user) {
                $events[] = [
                    'events' => $event,
                    'user' => $user,
                ];
            }
        }
        return view('admin.admin-pending-events', compact('events'));
    }

    public function approvedEvents()
    {
        $eventsData = Event::where('approved', 1)->get();

        $events = [];
        foreach ($eventsData as $event) {
            $user = User::find($event->user_id);
            if ($user) {
                $events[] = [
                    'events' => $event,
                    'user' => $user,
                ];
            }
        }

        return view('admin.admin-approved-events', compact('events'));
    }

    public function allUsers()
    {
        $users = User::all();
        return view('admin.admin-users', compact('users'));
    }

    public function deleteEvent($event)
    {
        $eventToDelete = Event::find($event);

        if (!$eventToDelete) {
            $eventsData = Event::where('approved', 1)->get();

            $events = [];
            foreach ($eventsData as $event1) {
                $user = User::find($event1->user_id);
                if ($user) {
                    $events[] = [
                        'events' => $event1,
                        'user' => $user,
                    ];
                }
            }
            return view('admin.admin-approved-events', compact('events'))->with('error', 'Event not found');
        } else {
            $eventToDelete->delete();

            // Delete event image from storage
            if ($eventToDelete->photo_path !== 'images/thumbnail/default.jpg') {
                Log::info("Deleting file: " . $eventToDelete->photo_path);
                Storage::disk('public')->delete($eventToDelete->photo_path);
            }

            $eventsData = Event::where('approved', 1)->get();

            $events = [];
            foreach ($eventsData as $event1) {
                $user = User::find($event1->user_id);
                if ($user) {
                    $events[] = [
                        'events' => $event1,
                        'user' => $user,
                    ];
                }
            }

            return view('admin.admin-approved-events', compact('events'));
        }
    }

    public function approveEvent($event)
    {
        $eventToUpdate = Event::find($event);
        $eventToUpdate->update(['approved' => 1]);

        $eventsData = Event::where('approved', 0)->get();

        $events = [];
        foreach ($eventsData as $event) {
            $user = User::find($event->user_id);
            if ($user) {
                $events[] = [
                    'events' => $event,
                    'user' => $user,
                ];
            }
        }
        return view('admin.admin-pending-events', compact('events'));
    }
}
