//
//  Points Screen.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 11/08/23.
//

import SwiftUI

struct PointsCard: View {
    var tournament: Tournament
    @StateObject var points: GameState = GameState(tournament: c1, groupId: 0, players: [0,1])
    @State var favorite: Int
    
    var body: some View {
        
        VStack{
            VStack{
                HStack{
                    Button(points.printPoints(i: 0)) {
                        points.pointsIncrease(i: 0)
                    }
                    Text("X")
                    Button(points.printPoints(i: 1)) {
                        points.pointsIncrease(i: 1)
                    }
                }
                Spacer()
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
                .padding(16)
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
            .frame(height: 177)
            .background(Color("light-orange"))
            .cornerRadius(16)
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color("orange"), lineWidth: 1)
            }
            MultiUseCell(text1: "Local", text2: "X", image: "pin.fill")
            MultiUseCell(text1: "Date", text2: "X", image: "calendar.badge.clock")
            MultiUseCell(text1: "Hour", text2: "X", image: "clock.fill")
        }
    }
}

struct PointsCard_Previews: PreviewProvider {
    static var previews: some View {
        PointsCard(tournament:c2,points: GameState(tournament: c2, groupId: 1, players: [0,1]),favorite:0)
    }
}
