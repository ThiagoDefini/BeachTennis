////
////  MatchesView.swift
////  BeachTennis
////
////  Created by Madu Maciel on 10/08/23.
////
//
//import SwiftUI
//
//struct MatchesView: View {
//    // @State var currentScreen: Tournament = .all
//    
//    @State var all: Bool = true
//    @State var favorites: Bool = false
//    
//    var tournaments: Tournament
//    var player: Person
//    @State var favorite = false
//    
//    var body: some View {
//        NavigationStack {
//            ZStack{
//                Color("bege")
//                    .edgesIgnoringSafeArea(.all)
//                Rectangle()
//                    .foregroundColor(Color("light-orange"))
//                    .frame(width: 440, height: 350)
//                    .edgesIgnoringSafeArea(.all)
//                    .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
//                    .offset(y: -400)
//                
//                VStack{
//                    Color("dark-orange")
//                        .frame(width: 440, height: 350)
//                        .edgesIgnoringSafeArea(.all)
//                        .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
//                        .offset(y: -300)
//                    
//                    MatchComponent2()
//                    HStack{
//                        Button("All"){
//                            
//                        }
//                        .frame(width: 160, height: 39)
//                        .background(all ? Color("blue") : .white)
//                        .cornerRadius(16)
//                        .foregroundColor(all ? .white: Color("blue"))
//                        .padding(.leading)
//                        .font(.subheadline)
//                        
//                        Button("Favorites"){
//                            
//                        }
//                        .frame(width: 160, height: 39)
//                        .background(favorite ? Color("blue") :.white )
//                        .cornerRadius(16)
//                        .foregroundColor(favorite ? .white : Color("blue"))
//                        .padding(.trailing)
//                        .font(.subheadline)
//                    }
//                    Spacer()
//                    VStack{
//                        ForEach(tournaments.tournamentMatches, id: \.self) { match in
//                            if (favorite == false){
////                                MatchCard(tournament: tournaments,favorite: match.id)
//                            }
//                            if(favorite == true){
//                                //for j in player.favorites{
//                                ForEach(player.playersFavorited, id: \.self){
//                                    j in
//                                    if(j.id == match.id){
//                                        MatchCard(tournament: tournaments, favorite: 0, tournamentMatches: [])
//                                    }
//                                }
//                            }
//                        }
//                        
//                    }
//                }
//                .padding(120)
//            }
//            
//        }
//    }
//}
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
