//
//  FirstScreenView.swift
//  BeachTennis
//
//  Created by Madu Maciel on 14/08/23.
//

import SwiftUI

struct FirstScreenView: View {
    @State private var name: String = ""
    @State private var joinGame = false
    @State private var createGame = false
    @State private var seeAll = false
    @State private var person: Person?
    @State private var champs: [Tournament]?
    
    @EnvironmentObject var vm: CloudKitCrudBootcampViewModel
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("bege")
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        VStack(alignment: .leading){
                            Text("Hi,")
                                .font(.custom("poppins", size: 28))
                                .foregroundColor(Color("gray"))
                               
                            Text("What we're gonna play today?")
                                .foregroundColor(Color("gray"))
                                .font(.custom("poppins", size: 16))
                        }
                        .padding(.leading,25)
                        Spacer()
                    }
                    .padding(.bottom)
                    HStack{
                        Text("Championships")
                            .font(.custom("poppins", size: 20))
                            .bold()
                            .foregroundColor(Color("gray"))
                            .padding(.leading,25)
                        Spacer()
                    }
                    .padding(.bottom)
                    HStack{
                        Button(action: { joinGame.toggle()

                        }, label: {
                            ZStack{
                                RoundedCorner(radius: 16)
                                    .stroke(lineWidth: 5)
                                    .frame(width: 165, height: 100)
                                    .background(.white)
                                    .foregroundColor(Color("blue"))
                                    .cornerRadius(16)
                                VStack{
                                    Image(systemName: "figure.tennis")
                                        .font(.system(size: 22))
                                        .foregroundColor(Color("blue"))
                                    Text("Join")
                                        .foregroundColor(Color("blue"))
                                }

                            }
                        })
                        .sheet(isPresented: $joinGame, content:{
                            EnterChampionshipView()
                                .onAppear{
                                    vm.updateData()
                                }

                        })
                        Spacer()
                            .frame(width: 20)

                        Button(action: { createGame.toggle()}, label: {
                            ZStack{
                                RoundedCorner(radius: 16)
                                    .stroke(lineWidth: 5)
                                    .frame(width: 165, height: 100)
                                    .background(.white)
                                    .foregroundColor(Color("blue"))
                                    .cornerRadius(16)
                                VStack{
                                    Image(systemName: "tennis.racket")
                                        .font(.system(size: 22))
                                        .foregroundColor(Color("blue"))
                                    Text("Create")
                                        .foregroundColor(Color("blue"))
                                }
                            }
                        })
                        .sheet(isPresented: $createGame, content:{
                            CreateChamp()
                                .onAppear{
                                    vm.updateData()
                                }
                        })

                    }
                    VStack{
                        VStack{
                            HStack{
                                Text("Participating championships")
                                    .font(.custom("poppins", size: 20))
                                    .bold()
                                    .foregroundColor(Color("gray"))
                                    .padding(.leading,25)
                                Spacer()
                            }

                            if let playingTournaments = vm.playingTournaments, !playingTournaments.isEmpty{
                                ScrollView(.horizontal){
                                    HStack{
                                        ForEach(playingTournaments) { tours in
                                            TournamentCard(tournament: tours)
                                        }
                                    }
                                }
                            } else {

                                NoGames()
                                    .padding(.top,80)

                            }
                        }
                        .padding(.top)
                        VStack{
                            HStack{
                                Text("Created championships")
                                    .font(.custom("poppins", size: 20))
                                    .bold()
                                    .foregroundColor(Color("gray"))
                                    .padding(.leading,25)
                                Spacer()
                            }


                            if !vm.ownerTournaments.isEmpty {
                                ScrollView(.horizontal){
                                    HStack{
                                        ForEach(vm.ownerTournaments) { champ in
                                            TournamentCard(tournament: champ)
                                        }
                                    }
                                }


                            } else {

                                NoGames()
                                    .padding(.top,60)
                            }

                        }
                        .padding(.top,70)
                    }

                }
                .padding(.bottom,50)
            }
        }
    }
}

//struct FirstScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        FirstScreenView()
//    }
//}
