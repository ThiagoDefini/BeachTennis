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

    var tournaments: Tournament
    var player: User
    @State var favorite = false
    var body: some View {
        NavigationStack{
            ZStack{
                Color("bege")
                    .edgesIgnoringSafeArea(.all)
                Rectangle()
                    .foregroundColor(Color("light-orange"))
                    .frame(width: 440, height: 350)
                    .edgesIgnoringSafeArea(.all)
                    .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
                    .offset(y: -400)
                VStack{

                    Color("dark-orange")
                        .frame(width: 440, height: 350)
                        .edgesIgnoringSafeArea(.all)
                        .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
                        .offset(y: -300)

                    MatchComponent2()
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
                       // if all ==
//                        Button(action: {
//                            favorites.toggle()
//                        }, label: {
//                            Text("Favorites")
//                                .frame(width: 171, height: 36)
//                                .foregroundColor(Color(favorites == true ? .white : UIColor(named: "blue")!))
//                                .background(Color(favorites == true ? UIColor(named: "blue")!: .white ))
//                                .cornerRadius(16)
//                        })
                    //    MatchCard(tournament: Tournament, favorite: 1)

                    }
                    
                }
            }
            
        }
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

                        Button("All"){

                        }
                        .frame(width: 160, height: 39)
                        .background(favorite ? Color("blue") : .white)
                        .cornerRadius(16)
                        .foregroundColor(favorite ? .white: Color("blue"))
                        .padding(.leading)
                        .font(.subheadline)
                        
                        Button("Favorites"){

                        }
                        .frame(width: 160, height: 39)
                        .background(favorite ? .white: Color("blue"))
                        .cornerRadius(16)
                        .foregroundColor(favorite ? Color("blue") : .white)
                        .padding(.trailing)
                        .font(.subheadline)


                    }
                    Spacer()
                    VStack{
                        ForEach(tournaments.tournamentMatches, id: \.self) { match in
                                if (favorite == false){
                                    MatchCard(tournament: tournaments,favorite: match.id)
                              }
                                if(favorite == true){
                                  //for j in player.favorites{
                                    ForEach(player.playersFavorited, id: \.self){
                                        j in
                                        if(j.id == match.id){
                                            MatchCard(tournament: tournaments,favorite:match.id)
                                     }
                              }
                            }
                        }

                    }
                }
                .padding(120)
            }
            
        }
    }
}

//struct MatchesView_Previews: PreviewProvider {
//    static var previews: some View {
//        MatchesView(tournament:c2)
//    }
//}
struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesView(tournaments:c2, player: User(id: 0, name: "", contact: "", tournamentsCreated: [], tournamentsRegistered: [], playersFavorited: []))
    }
}

