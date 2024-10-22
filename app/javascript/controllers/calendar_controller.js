import { Controller } from "@hotwired/stimulus"
import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';

// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = ["calendar"]

  async connect() {
    const courses = await fetch('/courses/calendar_format')
    const events = await courses.json()
    console.log(events.data)
    let calendar = new Calendar(this.calendarTarget, {
      events: events.data,
      plugins: [ dayGridPlugin ],
      initialView: 'dayGridMonth',
      headerToolbar: {
        left: 'prev,next today',
        center: 'title'
      }
    });
    calendar.render();
  }
}