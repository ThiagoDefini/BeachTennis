//
//  JoinChampNoButton.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 17/08/23.
//

import SwiftUI

struct JoinChampNoButton: View, Shape {
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
                   Image("background")
                        .resizable()
                        .frame(width: 440, height: 400)
                        .frame(width: 440, height: 350)
                        .edgesIgnoringSafeArea(.all)
                        .cornerRadius(40, corners: [.bottomLeft, .bottomRight])                }
                        .offset(y: -300)
                      
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
                                Text("Location")
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
                        
                        NavigationLink(destination: MatchesView(tournament: tournament), label: {
                            HStack(spacing:10){
                                Image("mapa")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxHeight:18)
                                    .frame(maxWidth:18)
                                    .foregroundColor(Color("orange"))
                                VStack(alignment: .leading){
                                    Text("Games")
                                        .foregroundColor(.black)
                                        .font(.title2)
                                    Text(String(tournament.players.count/2))
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
                            .background(.white)
                            .overlay {
                                RoundedCorner(radius: 16)
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(Color("orange"))
                            }
                            
                        })
                        Spacer()
                        
                    }
                    //Spacer()
            }
        }
    }
}
  
        

struct JoinChampNoButton_Previews: PreviewProvider {
    static var previews: some View {
        JoinChampNoButton(tournament: c1!)
    }
}

