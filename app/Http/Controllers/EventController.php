<?php

namespace App\Http\Controllers;

use App\Models\Event;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;

class EventController extends Controller
{
    public function index()
    {
        $latestEvent = Event::where('approved', 1)->latest()->first();
        $approvedEvents = Event::where('approved', 1)->get();

        // Pass the latest event to the view
        // dd($latestEvent->attributes);
        return view('home.home', compact('latestEvent', 'approvedEvents'));
    }

    public function createEvent()
    {
        $categories = [
            'Music',
            'Drama',
        ];
        return view('event.create', ['categories' => $categories]);
    }

    public function store(Request $request)
    {
        // Validate the request data
        $validatedData = $request->validate([
            'event_name' => 'required|min:1',
            'date' => 'required|date',
            'time' => 'required',
            'location' => 'required|min:2',
            'description' => 'required',
            'category' => 'required',
            't1_name' => 'required',
            't1_price' => 'required',
            't1_count' => 'required',
            't2_name' => 'required',
            't2_price' => 'required',
            't2_count' => 'required',
            't3_name' => 'required',
            't3_price' => 'required',
            't3_count' => 'required',
            'user_id' => 'required',
        ]);
        // dd($request->file('photo'));

        // Create and save the event
        $event = new Event($validatedData);
        $event->user_id = $request->input('user_id'); // Get user ID from the request
        $event->approved = 0;
        $event->t1_sold = 0;
        $event->t2_sold = 0;
        $event->t3_sold = 0;
        $event->photo_path = 'images/thumbnail/default.jpg';
        $event->save();

        // Handle file upload
        if ($request->hasFile('photo') && $request->file('photo')->isValid()) {
            $file = $request->file('photo');

            $updated_path = 'images/thumbnail/' . $event->id . '.' . $file->getClientOriginalExtension();

            $event->update(['photo_path' => $updated_path]);

            // Generate a unique filename for the photo
            $filename = $event->id . '.' . $file->getClientOriginalExtension();

            // Store the file in the specified directory with the unique filename
            // $file->storeAs('images/thumbnail', $filename, 'public');
            if ($file->storeAs('images/thumbnail', $filename, 'public')) {
                // dd("uploaded");
            } else {
                // dd("not uploaded");
                // Log an error if the file upload fails
                Log::error('Failed to upload file: ' . $file->getClientOriginalName());
            }
        }

        // Redirect to a success page or any other action you want
        return redirect('/')->with('success', 'Event created successfully!');
    }

    public function allApprovedEvents()
    {
        $events = Event::where('approved', 1)->get();
        return view('event.allevents', ['events' => $events]);
    }

    public function showEvent($event)
    {
        $eventData = Event::find($event);
        return view('event.event', compact('eventData'));
    }

    public function myEvents($userId)
    {
        $events = Event::where('user_id', $userId)->get();
        return view('event.myevents', ['events' => $events]);
    }

    public function deleteEvent($event)
    {
        $eventToDelete = Event::find($event);
        $EventOwnerId = $eventToDelete->user_id;
        // dd($EventOwnerId);
        // dd($eventToDelete->photo_path);
        $eventToDelete->delete();

        // Delete event image from storage
        if ($eventToDelete->photo_path !== 'images/thumbnail/default.jpg') {
            // Delete event image from storage
            // Storage::delete($eventToDelete->photo_path);
            Log::info("Deleting file: " . $eventToDelete->photo_path);
            Storage::disk('public')->delete($eventToDelete->photo_path);
        }

        $events = Event::where('user_id', $EventOwnerId)->get();
        return view('event.myevents', ['events' => $events]);
    }

    public function myEventDetails($event)
    {
        $eventData = Event::find($event);
        return view('event.myevent-details', compact('eventData'));
    }

    public function edit($event)
    {
        $categories = [
            'Music',
            'Drama',
        ];
        $eventData = Event::find($event);
        return view('event.edit-event', compact('eventData', 'categories'));
    }

    public function update(Event $event)
    {
        // Validate the request data
        $validatedData = request()->validate([
            'event_name' => 'required|min:1',
            'date' => 'required|date',
            'time' => 'required',
            'location' => 'required|min:2',
            'description' => 'required',
            'category' => 'required',
            't1_name' => 'required',
            't1_price' => 'required',
            't1_count' => 'required',
            't2_name' => 'required',
            't2_price' => 'required',
            't2_count' => 'required',
            't3_name' => 'required',
            't3_price' => 'required',
            't3_count' => 'required',
            'user_id' => 'required',
        ]);
        // dd($validatedData);

        $event->update($validatedData);

        // Handle file upload
        if (request()->hasFile('photo') && request()->file('photo')->isValid()) {
            $file = request()->file('photo');

            $updated_path = 'images/thumbnail/' . $event->id . '.' . $file->getClientOriginalExtension();

            $event->update(['photo_path' => $updated_path]);

            // Generate a unique filename for the photo
            $filename = $event->id . '.' . $file->getClientOriginalExtension();

            // Store the file in the specified directory with the unique filename
            // $file->storeAs('images/thumbnail', $filename, 'public');
            if ($file->storeAs('images/thumbnail', $filename, 'public')) {
                // dd("uploaded");
            } else {
                // dd("not uploaded");
                // Log an error if the file upload fails
                Log::error('Failed to upload file: ' . $file->getClientOriginalName());
            }
        }

        // Redirect to a success page or any other action you want
        return redirect('/')->with('success', 'Event created successfully!');
    }
}
