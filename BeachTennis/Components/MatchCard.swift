//
//  MatchCard.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 08/08/23.
//

import SwiftUI

struct MatchCard: View {
    var tournament: Tournament
    @State var favorite: Int
    
    var body: some View {
        VStack(spacing: 20){
            HStack{
                Text("Match #12")
                    .foregroundColor(Color("orange"))
                    .bold()
                    .padding(.top)
                Spacer()
                ZStack{
                    Button {
                        if(favorite == 1){
                            favorite = 0
                        }else{favorite = 1}
                    } label: {
                        Image(systemName: favorite == 1 ? "heart.fill" : "heart")
                    }
                }
              
            }
            .padding(.top)
           
            HStack {
                VStack(spacing: 5){
                    Text(tournament.tournamentMatches[0].player.split(separator: "&")[0])
                        .foregroundColor(.black)
                    Text(tournament.tournamentMatches[0].player.split(separator: "&")[1])
                        .foregroundColor(.black)                }
                Spacer()
                Text("X")
                    .foregroundColor(Color("orange"))
                    .bold()
                Spacer()
                VStack(spacing: 5){
                    Text(tournament.tournamentMatches[0].player.split(separator: "&")[0])
                        .foregroundColor(.black)
                    Text(tournament.tournamentMatches[0].player.split(separator: "&")[1])
                        .foregroundColor(.black)
                }
            }
            HStack{
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: "calendar.badge.clock")
                            .foregroundColor(Color("orange"))
                        Text("12/04/2023 - 17:00 PM")
                            .foregroundColor(.black)
                    }
                    HStack{
                        Image("mapa")
                            .resizable()
                            .frame(width: 18, height: 20)
                        
                        Text("Quadra 3")
                            .foregroundColor(.black)

                    }
                }
                .padding()
                Spacer()
            }
            .background(Color("dark-bege"))
            .frame(width: 350)
            .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
            .overlay {
                RoundedCorner(radius: 16, corners: [.bottomLeft, .bottomRight])
                    .stroke(lineWidth: 1)
            }
        }
        .padding(16)
        .frame(width: 350)
        .frame(height: 207)
        .cornerRadius(16)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color("orange"), lineWidth: 1)
        }
    }
}

struct MatchCard_Previews: PreviewProvider {
    static var previews: some View {
        MatchCard(tournament:c2,favorite:0)
    }
}
