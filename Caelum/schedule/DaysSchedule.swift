//
//  DaysSchedule.swift
//  Caelum
//

import EventKit

let store = EKEventStore()

let calendar = Calendar.current
let startOfDay = calendar.startOfDay(for: Date())
let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)!

// Assumes there is a model type `Event` defined elsewhere in the project
// with an initializer: Event(title:startDate:endDate:)

func fetchAllEventsForTheDay() async -> [Event] {
    // Request authorization to access calendar events. This call is async and can throw.
    do {
        let authorized = try await store.requestFullAccessToEvents()
        guard authorized else { return [] }
    } catch {
        // Authorization failed due to an error (e.g., user denied or system error)
        return []
    }

    // Build predicate for today's events
    let predicate = store.predicateForEvents(withStart: startOfDay, end: endOfDay, calendars: nil)

    // Fetch and map events
    let events = store.events(matching: predicate)
    var usersEvents: [Event] = []
    usersEvents.reserveCapacity(events.count)

    for event in events {
        let userEvent = Event(title: event.title, startDate: event.startDate, endDate: event.endDate)
        usersEvents.append(userEvent)
    }

    return usersEvents
}
