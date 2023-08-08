//
//  MatchCard.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 08/08/23.
//

import SwiftUI

struct MatchCard: View {
    var tournament: Tournament
    var number: Int
    @State private var name: String = ""
    @State private var name2: String = ""
    
    var body: some View {
        VStack(spacing: 30){
            
//            HStack {
//                Text("Horário")
//                Spacer()
//                Text("Partida")
//                Spacer()
//                Text("Estrela")
//            }
//            .padding(16)
            HStack{
                    Text("⏱️: 10:00")
                        .foregroundColor(.black)
                Spacer()
                Text("Match:")
                    .foregroundColor(.black)
                Spacer()
                Text("⭐️")
                    .foregroundColor(.black)
            }
            HStack{
                Text("📌: Quadra 3")
                    .foregroundColor(.black)
                Spacer()
            }

            
            HStack {
                VStack(spacing: 5){
                    Text(tournament.tournamentMatches[0].player.split(separator: "&")[0])
                        .foregroundColor(.black)
                    Text(tournament.tournamentMatches[0].player.split(separator: "&")[1])
                        .foregroundColor(.black)                }
                Spacer()
                Text("X")
                Spacer()
                VStack(spacing: 5){
                    Text(tournament.tournamentMatches[0].player.split(separator: "&")[0])
                        .foregroundColor(.black)
                    Text(tournament.tournamentMatches[0].player.split(separator: "&")[1])
                        .foregroundColor(.black)
                }
            }
        }
        .padding(16)
        .frame(width: 340)
        .frame(height: 170)
        .background(Color.yellow)
        .cornerRadius(16)
    }
}

struct MatchCard_Previews: PreviewProvider {
    static var previews: some View {
        MatchCard(tournament:c2,number:0)
    }
}
