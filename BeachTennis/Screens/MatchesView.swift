//
//  MatchesView.swift
//  BeachTennis
//
//  Created by Madu Maciel on 10/08/23.
//

import SwiftUI

struct MatchesView: View {
  //  @State var currentScreen: Tournament = .all
    var body: some View {
        NavigationStack{
            ZStack{
                Color("bege")
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Image("jiji")
                        .resizable()
                        .frame(width: 440, height: 350)
                        .edgesIgnoringSafeArea(.all)
                        .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
                        .offset(y: -300)
                    MatchComponent2()
                        .offset(y: -370 )
                    HStack{
//                        Button(action: {
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


                    }
//                    MatchCard(tournament: Tournament , favorite: 1)
                }
            }
            
        }
    }
}

struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesView()
    }
}