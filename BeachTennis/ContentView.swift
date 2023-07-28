//
//  ContentView.swift
//  BeachTennis
//
//  Created by Thiago Defini on 18/07/23.
//
import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Toque para ativar notificação") {
                sendNotification(title: "1 nova mensagem", subtitle: "Thiago é um chato", secondsLater: 5, isRepeating: false)
            }
            
        }
        .padding()
    }
}

func scheduleNotification() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { _, error in
           if let error {
               print("error", error.localizedDescription)
           }
       }
}

func sendNotification(title: String, subtitle: String, secondsLater: TimeInterval, isRepeating: Bool) {
    //.... code from previous steps
    

    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
        if let error {
            print("error", error.localizedDescription)
        }
    }
    // Define the content
    let content = UNMutableNotificationContent()
    content.title = title
    content.subtitle = subtitle
    content.sound = .default
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: secondsLater, repeats: isRepeating)
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request)

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
