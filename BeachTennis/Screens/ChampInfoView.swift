//
//  ChampInfoView.swift
//  BeachTennis
//
//  Created by Madu Maciel on 04/08/23.
//

import SwiftUI

struct ChampInfoView: View, Shape {
    @State var addPlayers: Bool = false
//    var tournament = Tournament(name: "Torneio dos Guri", tournamentType: .Tree, organizerId: "2", selectedCourt: 0, nodesCreated: 0, numGroups: 0, players: [], courts: [], startDate: "17/02", endDate: "18/02", startTime: "13:00", endTime: "17:00", ranking: [], tournamentMatches: [], groups: [], location: "Centro Histórico", address: "Borges de Medeiros 123")
    var tournament: Tournament
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    let link = URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!
    
    func path(in rect: CGRect) -> Path {
           let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
           return Path(path.cgPath)
       }
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color("bege")
                    .edgesIgnoringSafeArea(.all)
                ZStack{
                    Rectangle()
                        .foregroundColor(Color("light-orange"))
                        .frame(width: 440, height: 400)
                        .edgesIgnoringSafeArea(.all)
                        .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
                        .offset(y: -440)
                }
                        //.offset(y: -370 )
                    VStack{
                        Spacer()
                        CreateComponent(tournament: tournament)
                        //Spacer()
                        HStack(spacing:10){
                            Image("mapa")
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight:18)
                                .frame(maxWidth:18)
                                .foregroundColor(Color("orange"))
                            VStack(alignment: .leading){
                                Text("Local")
                                    .foregroundColor(.black)
                                    .font(.title2)
                                Text(tournament.location)
                                    .foregroundColor(.black)
                                    .font(.subheadline)
                            }
                            .padding(10)
                            Spacer()
                        }
                        .padding(16)
                        .frame(width: 340)
                        .frame(height: 70)
                        .cornerRadius(16)
                        .overlay {
                            RoundedCorner(radius: 16)
                                .stroke(lineWidth: 2)
                                .foregroundColor(Color("orange"))
                        }
                        MultiUseCell(text1: "Date", text2: tournament.startDate, image: "calendar.badge.clock")
                        
                        MultiUseCell(text1: "Hour", text2: tournament.startTime, image: "clock.fill")
                        
                        Spacer()

                        Button("Enter championship"){
                            
                        }
                        .frame(width: 372, height: 65)
                        .foregroundColor(Color("bege"))
                        .background(Color("blue"))
                        .cornerRadius(20)
                        
                    }
                    //Spacer()
            }
        }
    }
}
  
        

struct ChampInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ChampInfoView(tournament: c1!)
    }
}
