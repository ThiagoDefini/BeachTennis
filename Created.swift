//
//  Created.swift
//  BeachTennis
//
//  Created by Madu Maciel on 01/08/23.
//

import SwiftUI

struct Created: View {
    @State private var scale = 1.0
   
    @State var link = URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!
    var code: String
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .topTrailing){
                Button(action: {
                   
                    }, label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                })
                VStack{
                    VStack{
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 89, height: 89)
                            .foregroundColor(Color("orange"))
                            .padding(.bottom)
                        Text("Championship created!")
                            .font(.system(size: 24))
                            .padding(.bottom, 100)
                            .bold()
                            .foregroundColor(Color("orange"))
                        
                    }
                    VStack{
                        Text("Share the code below to keep")
                            .foregroundColor(Color("gray"))
                            .bold()
                        Text("the athletes updated:")
                            .foregroundColor(Color("gray"))
                            .bold()
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundColor(Color("bege"))
                                .frame(width: 350, height: 107)
                            VStack{
                                
                                Text("83972")
                                    .foregroundColor(Color("gray"))
                                    .font(.system(size: 90))
                            }
                        }
                    }
                    .padding(.bottom, 150)
                    ZStack{
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 350, height: 64)
                            .foregroundColor(Color("blue"))
                        
                        ShareLink("Share code", item: link)
                            .foregroundColor(.white)
                            .bold()
                        
                    }
                    
                    //                NavigationLink("Share later", destination: ChampInfoView())
                    //                    .navigationBarBackButtonHidden(true)
                    //                    .foregroundColor(Color("orange"))
                    //                    .padding(.bottom)
                    //
                    //                    Button("Send notification") {
                    //                        sendNotification(title: "1 new notification", subtitle: "Your championship starts in 10 minutes🎾🏆", secondsLater: 7, isRepeating: false)
                    //                    }
                    //                    .foregroundColor(Color("orange"))
                    //
                    //                .onAppear {
                    //                    UIApplication.shared.applicationIconBadgeNumber = 0
                    //                }
                    
                }
                
            }
           
            
        }
        .navigationBarHidden(true )
      
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
        Created(code: "61A86C2B-0ECF-4918-A193-286DE1F630E7")
    }
}
