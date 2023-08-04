//
//  Created.swift
//  BeachTennis
//
//  Created by Madu Maciel on 01/08/23.
//

import SwiftUI

struct Created: View {
    @Environment(\.dismiss) var dismiss
    
    let link = URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!
    
    
    var body: some View {
        NavigationView{
            VStack{
                
                Image("checkmark")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(.bottom)
                Text("Championship created!")
                    .padding(.bottom, 100)
                    .font(.headline)
                    .foregroundColor(Color("gray"))
                ZStack{
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color("bege"))
                        .frame(width: 329, height: 226)
                    VStack{
                        Text("Share the code below to keep")
                            .foregroundColor(Color("gray"))
                            .bold()
                        Text("the athletes updated:")
                            .foregroundColor(Color("gray"))
                            .bold()
                        Text("83972")
                            .foregroundColor(Color("gray"))
                            .font(.system(size: 90))
                    }
                }
                .padding(.bottom)
                ZStack{
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 350, height: 64)
                        .foregroundColor(Color("blue"))
                    
                    ShareLink("Share now", item: link)
                        .foregroundColor(.white)
                }
                
                NavigationLink("Share later", destination: ChampInfoView())
                    .navigationBarBackButtonHidden(true)
                    .foregroundColor(Color("blue"))
                    .padding(.bottom)
                
                    Button("Send notification") {
                        sendNotification(title: "1 new notification", subtitle: "Your championship starts in 10 minutes🎾🏆", secondsLater: 7, isRepeating: false)
                    }
                    .foregroundColor(Color("blue"))
                    
                .onAppear {
                    UIApplication.shared.applicationIconBadgeNumber = 0
                }

            }
            
        }
        
        
      
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
    content.badge = 1
    
    
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: secondsLater, repeats: isRepeating)
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request)
    
}

struct Created_Previews: PreviewProvider {
    static var previews: some View {
        Created()
    }
}
