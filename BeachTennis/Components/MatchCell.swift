//
//  MatchCell.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 15/08/23.
//

import SwiftUI

struct MatchCell: View {
    var tournament: Tournament
    @State var favorite: Int
    
    var body: some View {
        VStack(spacing: 20){
            Spacer()
            HStack{
                Text("Match #12")
                    .bold()
                    .foregroundColor(.brown)
                Spacer()
                Image(systemName: "clock.fill")
                    .foregroundColor(Color("orange"))
                Text("17:00")
                    .foregroundColor(.black)
                    .font(.subheadline)
            }
            .padding(.top)
            .padding(.horizontal)
            HStack{
                VStack(alignment: .leading){
                    HStack {
                        VStack(spacing: 5){
                            Text(tournament.tournamentMatches[0].player.split(separator: "&")[0])
                                .foregroundColor(.black)
                                .bold()
                            Text(tournament.tournamentMatches[0].player.split(separator: "&")[1])
                                .foregroundColor(.black)
                                .bold()

                        }
                        Spacer()
                        Text("X")
                            .foregroundColor(Color("orange"))
                            .bold()
                        Spacer()
                        VStack(spacing: 5){
                            Text(tournament.tournamentMatches[0].player.split(separator: "&")[0])
                                .foregroundColor(.black)
                                .bold()

                            Text(tournament.tournamentMatches[0].player.split(separator: "&")[1])
                                .foregroundColor(.black)
                                .bold()

                        }
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                .padding()
            }
            .background(.white)
            .frame(width: 390)
            .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
            .overlay {
                RoundedCorner(radius: 16, corners: [.bottomLeft, .bottomRight])
                    .stroke(lineWidth: 1)
            }
            Spacer()
        }
        .frame(width: 370)
        .frame(height: 140)
        .background(Color("light-orange"))
        .cornerRadius(16)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color("orange"), lineWidth: 1)
        }
    }

}
struct MatchCell_Previews: PreviewProvider {
    static var previews: some View {
        MatchCell(tournament:c2,favorite:0)
    }
}
