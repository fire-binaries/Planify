//
//  SwiftUIView3.swift
//  ichrakkkk Watch App
//
//  Created by Ichrak El Hatimi on 2023-01-22.
//

import SwiftUI
import EventKit

class MyWatchOSApp: WKInterfaceController {
    let eventStore = EKEventStore()

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        requestCalendarAccess()
    }

    func requestCalendarAccess() {
        switch EKEventStore.authorizationStatus(for: .event) {
        case .authorized:
            // Access granted, proceed with calendar access
            break
        case .denied:
            // Access denied, display alert to the user
            presentAlert(title: "Access Denied", message: "You have denied access to the calendar. To grant access, please go to the Watch app on your iPhone and enable calendar access.")
            break
        case .notDetermined:
            // Request access
            eventStore.requestAccess(to: .event) { (granted, error) in
                if granted {
                    // Access granted, proceed with calendar access
                } else {
                    // Access denied, display alert to the user
                    self.presentAlert(title: "Access Denied", message: "You have denied access to the calendar. To grant access, please go to the Watch app on your iPhone and enable calendar access.")
                }
            }
        default:
            // Handle other cases
            break
        }
    }
    func presentAlert(title: String, message: String) {
        let ok = WKAlertAction(title: "OK", style: .default) {
        }
        presentAlert(withTitle: title, message: message, preferredStyle: .alert, actions: [ok])
    }
    
    func createReminder() {
        let reminder = EKReminder(eventStore: eventStore)
        reminder.title = "Reminder Title"
        reminder.dueDateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: Date() + 3600)
        reminder.calendar = eventStore.defaultCalendarForNewReminders()
        do {
           //try eventStore.addScheduledReminder(reminder)
        } catch {
            print("Error saving reminder: \(error)")
        }
    }
}



struct SwiftUIView3: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SwiftUIView3_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView3()
    }
}
