//
//  MatchesView.swift
//  BeachTennis
//
//  Created by Madu Maciel on 10/08/23.
//

import SwiftUI

struct MatchesView: View {
  //  @State var currentScreen: Tournament = .all
    @State var all = true
    @State var favorites = false
    var body: some View {
        NavigationStack{
            ZStack{
                Color("bege")
                    .edgesIgnoringSafeArea(.all)
                VStack{
                  Image("background")
                        .resizable()
                        .frame(width: 440, height: 350)
                        .edgesIgnoringSafeArea(.all)
                        .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
                       
                    MatchComponent2()
                        .offset(y: -60)
                    HStack{
                        Button(action: {
                            all.toggle()
                        }, label: {
                            Text("All")
                                .frame(width: 171, height: 36)
                                .foregroundColor(Color(all == true ? .white : UIColor(named: "blue")!))
                                .background(Color(all == true ? UIColor(named: "blue")!: .white ))
                                .cornerRadius(16)
                        })
                    }
                    
                }
                .padding(.bottom, 500)
            }
            
        }
    }
}

struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesView()
    }
}

//Button(action: {
////                            currentScreen = .janeiro
//                        }) {
//                            ZStack{
//                                RoundedRectangle(cornerRadius: 20)
//                                    .stroke(Color("blue"), lineWidth: 2)
//                                    .foregroundColor(Color(currentScreen == .janeiro ? UIColor(named: "color3")! : .white))
//
//                                    .frame(width: 80, height: 40)
//
//
//
//
//                                Text("Janeiro")
//                                    .font(.system(size: 16))
//                                    .foregroundColor(Color(currentScreen == .janeiro ? .white :  UIColor(named: "color3")!))

//(tournament: Tournament , favorite: 1)
