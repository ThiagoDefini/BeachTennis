//
//  Created.swift
//  BeachTennis
//
//  Created by Madu Maciel on 01/08/23.
//

import SwiftUI

struct Created: View {
    @Environment(\.dismiss) var dismiss
    @State var navigationBarBackButtonHidden = true
    
    @State var link = URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!
    
    
    var body: some View {
    NavigationView{
        VStack{
            
            Image("checkmark")
                .frame(width:180, height: 180)
                .padding(.bottom)
            Text("Championship created!")
                .foregroundColor(Color("gray"))
                .padding(.bottom, 100)
                .font(.headline)
            ZStack{
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(Color("bege"))
                    .frame(width: 329, height: 226)
                VStack{
                    Text("Share the code below to keep")
                        .foregroundColor(Color("gray"))
                        .frame(width: 241, height: 44)
                        .font(.headline)
                        .padding(.bottom, -30)
                    Text("the athletes updated:")
                        .foregroundColor(Color("gray"))
                        .frame(width: 241, height: 44)
                        .font(.headline)
                        .padding(.bottom, -20)
                    Text("83972")
                        .foregroundColor(Color("gray"))
                        .font(.system(size: 80))
                        
                    
                    
                }
            }
            ZStack{
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 350, height: 64)
                    .foregroundColor(Color("blue"))
                ShareLink("Share now", item: link)
                    .foregroundColor(.white)
                
            }
//            NavigationLink(destination: Managing(), label: {Text("Share later")
//                    .foregroundColor(Color("blue"))
//            })
//            .navigationBarBackButtonHidden(true)
        }
        }
    }
}

//
//struct Toogle: View {
//    @State private var showingSheet = false
//
//    var body: some View {
//        Button("Show Sheet") {
//            showingSheet.toggle()
//        }
//        .sheet(isPresented: $showingSheet) {
//            Created()
//        }
//    }
//}
struct Created_Previews: PreviewProvider {
    static var previews: some View {
        Created()
    }
}
