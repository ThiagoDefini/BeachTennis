//
//  ChampInfoView.swift
//  BeachTennis
//
//  Created by Madu Maciel on 04/08/23.
//

import SwiftUI

struct ChampInfoView: View, Shape {
    @State var addPlayers: Bool = false
    var tournament: Tournament
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    @EnvironmentObject var vm: CloudKitCrudBootcampViewModel
    
    var link: String = ""
        
    func path(in rect: CGRect) -> Path {
           let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
           return Path(path.cgPath)
       }
    
    var body: some View {
//        NavigationStack{
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
                        
                        NavigationLink(destination: MatchesView(tournament: tournament), label: {
                            HStack(spacing:10){
                                Image("mapa")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxHeight:18)
                                    .frame(maxWidth:18)
                                    .foregroundColor(Color("orange"))
                                VStack(alignment: .leading){
                                    Text("Jogos")
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

                        Button("Start Championship"){
//                            var tour = tournament
//                            tour.createTournamentTree()
//
//                            vm.updateTournament(tournament: tour)
                        }
                        .frame(width: 372, height: 65)
                        .foregroundColor(Color("bege"))
                        .background(Color("blue"))
                        .cornerRadius(20)
                        
                    }
                    //Spacer()
            }
            .onAppear{
//                self.link = tournament.id
            }
//        }
    }
}
  
        

struct ChampInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ChampInfoView(tournament: c1!)
    }
}
