//
//  MatchesView.swift
//  BeachTennis
//
//  Created by Madu Maciel on 10/08/23.
//

import SwiftUI

struct MatchesView: View {
  //  @State var currentScreen: Tournament = .all
    var tournament: Tournament
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
                    VStack{
//                        for match in tournament.tournamentMatches{
//                            if (favorite == false){
//                              MatchCard(tournament,i)
//                          }
//                            if(favorite == true){
//                              for j in player.favorites{
//                                  if(j.id == i.id){
//                                  MatchCard(tournament,i)
//                                 }
//                          }
//                        }
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
