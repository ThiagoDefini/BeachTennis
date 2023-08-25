//
//  MatchesView.swift
//  BeachTennis
//
//  Created by Madu Maciel on 10/08/23.
//

import SwiftUI

struct MatchesView: View {
  //  @State var currentScreen: Tournament = .all
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
                    MatchComponent2()
                    HStack{
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
//                    VStack {
//                        if let nodess = vm.nodesById {
//                            ForEach(returnsStrings(nodes: nodess), id: \.0) { node in
//                                MatchCard(tournament: tournaments!,team:1,favorite: 0, names:[node.0,node.1])
//                            }
//                        }
//
//                    }
                }
                .padding(120)
            }
            
        }
    }
}

struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesView(tournaments:c2, player: User(id: 0, name: "", contact: "", tournamentsCreated: [], tournamentsRegistered: [], playersFavorited: []))
    }
}
