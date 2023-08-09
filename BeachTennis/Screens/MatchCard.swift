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
        VStack(spacing: 20){
            
//            HStack {
//                Text("Horário")
//                Spacer()
//                Text("Partida")
//                Spacer()
//                Text("Estrela")
//            }
//            .padding(16)
            HStack{
                Text("Match:")
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
            HStack{
                VStack(alignment: .leading){
                    Text("📌: Quadra 3")
                        .foregroundColor(.black)
                    Text("🗓️ 12/04/2023 - 17:00 PM")
                        .foregroundColor(.black)
                }
                .padding(16)
                Spacer()
            }
            .background(Color.blue)
            .frame(width: 340)
            .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
            .overlay {
                RoundedCorner(radius: 16, corners: [.bottomLeft, .bottomRight])
                    .stroke(lineWidth: 1)
            }
        }
        .padding(16)
        .frame(width: 340)
        .frame(height: 180)
        .background(Color.yellow)
        .cornerRadius(16)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(lineWidth: 1)
        }
    }
}

struct MatchCard_Previews: PreviewProvider {
    static var previews: some View {
        MatchCard(tournament:c2,number:0)
    }
}
