//
//  SinglePlayerView.swift
//  BeachTennis
//
//  Created by Madu Maciel on 16/08/23.
//

import SwiftUI

struct SinglePlayerView: View {
    @State private var fullName: String = ""
//    @State private var addPlayerButton = false
    @State private var isCreated = false
    @EnvironmentObject var vm: CloudKitCrudBootcampViewModel
    @State var tournament: Tournament
    
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Insert the full name of the player bellow:")
                    .padding(.bottom,50)
                VStack{
                    Text("Player #1:")
                        .padding(.trailing, 290)
                        .foregroundColor(.black)
                    ZStack{
                        RoundedCorner(radius: 12)
                            .stroke(lineWidth: 0.5)
                            .foregroundColor(Color("blue"))
                            .frame(width: 400, height: 43)
                        HStack{
                            Image(systemName: "person.fill")
                                .foregroundColor(Color("orange"))
                                .offset(x: -20)
                            TextField("Full name", text: self.$fullName)
                                .foregroundColor(.black)
                        }
                        .padding(.leading, 50)
                    }
                }
                .padding(.bottom, 500)
               
                if fullName != ""{
                    NavigationLink {
                        SinglePlayer2View(tournament: tournament, player: fullName)
                            .onAppear{
                                vm.updateData()
                            }
                    } label: {
                        Text("Add player")
                            .frame(width: 350, height: 64)
                            .background(Color("blue"))
                            .foregroundColor(.white)
                            .cornerRadius(16)
                    }

                  
                }else{
                    Button(action: {
                        
                    }, label: {
                        Text("Add player")
                            .frame(width: 350, height: 64)
                            .background(Color("blue"))
                            .foregroundColor(.white)
                            .cornerRadius(16)
                        
                    })
                }
              
            }
            
            
            .navigationTitle("Single player")
            
        }.navigationBarBackButtonHidden()
        
    }
}
struct SinglePlayer2View: View{
    @State private var addCourt = false
    @EnvironmentObject var vm: CloudKitCrudBootcampViewModel
    @State var tournament: Tournament
    var player: String
    @EnvironmentObject var champFlow: ChampFlow
    
    var body: some View{
        NavigationView{
            VStack{
                Text("Please click the button below to add the players to the doubles team:")
                    .font(.system(size: 18))
                    .padding()
                
                NavigationLink(destination:
                                SinglePlayerView(tournament: tournament)
                    .onAppear{
                        vm.updateData()
                    }
                               , label: {
                    ZStack{
                        RoundedCorner(radius: 16)
                            .stroke(lineWidth: 5)
                            .frame(width: 165, height: 100)
                            .background(.white)
                            .foregroundColor(Color("blue"))
                            .cornerRadius(16)
                        VStack{
                            Image(systemName: "person.fill")
                                .font(.system(size: 40))
                                .foregroundColor(Color("blue"))
                            Text("Add single player")
                                .foregroundColor(Color("blue"))
                                .bold()
                        }
                    }
                })
                //                    ForEach(c2.tournamentMatches){ teams in
                //                        PlayerCell(team: teams, number: 1)
                //                            }
               NavigationLink(destination: AddCourtsView(), label: {
                   Text("Next")
                       .frame(width: 350, height: 64)
                       .background(Color("blue"))
                       .foregroundColor(.white)
                       .cornerRadius(16)
               })
//                .sheet(isPresented: $isCreated, onDismiss: {
//                    FirstScreenView()
//                }) {
////                    Created()
//
//                }
                
                
            }
            .navigationTitle("Include teams")
            .onAppear {
                tournament.addPlayers(player: player)
                vm.updateTournament(tournament: tournament)
            }
            
            
            
        }.navigationBarBackButtonHidden()
        
    }
}


struct SinglePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePlayerView(tournament: c1!)
       // SinglePlayer2View(tournament: c1!, player: "" )
    }
}
