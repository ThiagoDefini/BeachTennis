//
//  Created.swift
//  BeachTennis
//
//  Created by Madu Maciel on 01/08/23.
//

import SwiftUI

struct Created: View {
    @Environment(\.dismiss) var dismiss
    @State private var scale = 1.0
    
    @State var link = URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!
    
    
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .foregroundColor(Color("orange"))
                        .padding(.bottom)
                    Text("Championship created!")
                        .font(.system(size: 24))
                        .padding(.bottom, 100)
                        .bold()
                        .foregroundColor(Color("orange"))
                    
                }
                .animation(.easeOut(duration: 2), value: scale)
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
                        .foregroundColor(Color("orange"))
                    
                    ShareLink("Share now", item: link)
                        .foregroundColor(.white)
                }
                
                NavigationLink("Share later", destination: ChampInfoView())
                    .navigationBarBackButtonHidden(true)
                    .foregroundColor(Color("orange"))
                    .padding(.bottom)
                
                    Button("Send notification") {
                        sendNotification(title: "1 new notification", subtitle: "Your championship starts in 10 minutes🎾🏆", secondsLater: 7, isRepeating: false)
                    }
                    .foregroundColor(Color("orange"))
                    
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
