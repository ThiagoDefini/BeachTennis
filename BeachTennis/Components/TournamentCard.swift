//
//  TournamentCard.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 15/08/23.
//

import SwiftUI

struct TournamentCard: View {
    var tournament: Tournament
//    @State var favorite: Int
    
    var body: some View {
        VStack(){
            Spacer()
            HStack{
                Text(tournament.name)
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color("orange"))
                Spacer()
            }
            .padding(.top)
            .padding(.horizontal)
            HStack{
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: "calendar.badge.clock")
                            .foregroundColor(Color("orange"))
                        Text("\(tournament.startDate) - \(tournament.startTime)")
                            .foregroundColor(.black)
                            .font(.footnote)
                        Text("\(tournament.endDate) - \(tournament.endTime)")
                            .foregroundColor(.black)
                            .font(.footnote)
                    }
                    .padding(.horizontal)
                }
                .padding()
                Spacer()
            }
            .background(Color("dark-bege"))
            .frame(width: 390)
            .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
            .overlay {
                RoundedCorner(radius: 16, corners: [.bottomLeft, .bottomRight])
                    .stroke(lineWidth: 1)
            }
        }
        .frame(width: 370)
        .frame(height: 140)
        .background(.white)
        .cornerRadius(16)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color("orange"), lineWidth: 1)
        }
    }

}

struct TournamentCard_Previews: PreviewProvider {
    static var previews: some View {
//        TournamentCard(tournament:c2,favorite:0)
        TournamentCard(tournament: c1!)
    }
}
