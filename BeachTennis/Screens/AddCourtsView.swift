//
//  AddCourtsView.swift
//  BeachTennis
//
//  Created by Madu Maciel on 17/08/23.
//

import SwiftUI

struct AddCourtsView: View {
    @State private var court: String = ""
    @State private var isCreated = false
    
    var tournament: Tournament
    
    @EnvironmentObject var vm: CloudKitCrudBootcampViewModel
    
    var body: some View {
        NavigationView{
            ScrollView{
                
                HStack{
                    Text("Insert the courts bellow:")
                        .padding(.bottom,25)
                        .padding(.top, 50)
                        .padding(.leading, 20)
                    Spacer()
                }
                VStack(alignment: .leading){
                    Text("Court:")
                        .foregroundColor(.black)
                        .padding(.leading)
                    ZStack{
                        RoundedCorner(radius: 12)
                            .stroke(lineWidth: 0.5)
                            .foregroundColor(Color("blue"))
                            .frame(width: 400, height: 43)
                        HStack{
                            Image(systemName: "tennisball.fill")
                                .foregroundColor(Color("orange"))
                                .padding(.trailing)
                    
                            TextField("court name", text: self.$court)
                                .foregroundColor(.black)
                        }
                        .padding(.leading, 50)
                    }
                }
                .padding(.bottom, 250)
               
                if court != ""{
                    NavigationLink {
                        var tour = tournament
                        Created(code: tournament.id)
                            .onAppear{
                                tour.courts.append(court)
                                vm.updateTournament(tournament: tour)
                            }
                           
                    } label: {
                        Text("Create championship")
                            .frame(width: 350, height: 64)
                            .background(Color("blue"))
                            .foregroundColor(.white)
                            .cornerRadius(16)
                            .padding(.bottom,100)
                    }
                   


                }else{
                    Button(action: {
                        

                    }, label: {
                        Text("Create championship")
                            .frame(width: 350, height: 64)
                            .background(Color("blue"))
                            .foregroundColor(.white)
                            .cornerRadius(16)
                            .padding(.bottom,100)

                    })
                }
                    
            }
            
            
            .navigationTitle("Add court")
            .navigationBarBackButtonHidden(true)
            
        }
    }

}

//struct AddCourtsView2: View{
//    @State private var addCourt = false
//    @EnvironmentObject var vm: CloudKitCrudBootcampViewModel
//    @State var tournament: Tournament
//    var player: String
//    @EnvironmentObject var champFlow: ChampFlow
//
//    var body: some View{
//        NavigationView{
//            VStack{
//                Text("Please click the button below to add the players to the doubles team:")
//                    .font(.system(size: 18))
//                    .padding()
//
//                NavigationLink(destination:
//                                SinglePlayerView(tournament: tournament)
//                    .onAppear{
//                        vm.updateData()
//                    }
//                               , label: {
//                    ZStack{
//                        RoundedCorner(radius: 16)
//                            .stroke(lineWidth: 5)
//                            .frame(width: 165, height: 100)
//                            .background(.white)
//                            .foregroundColor(Color("blue"))
//                            .cornerRadius(16)
//                        VStack{
//                            Image(systemName: "person.fill")
//                                .font(.system(size: 40))
//                                .foregroundColor(Color("blue"))
//                            Text("Add team")
//                                .foregroundColor(Color("blue"))
//                                .bold()
//                        }
//                    }
//                })
//                //                    ForEach(c2.tournamentMatches){ teams in
//                //                        PlayerCell(team: teams, number: 1)
//                //                            }
//                NavigationLink(destination: AddCourtsView(tournament: tournament), label: {
//                   Text("Next")
//                       .frame(width: 350, height: 64)
//                       .background(Color("blue"))
//                       .foregroundColor(.white)
//                       .cornerRadius(16)
//               })
////                .sheet(isPresented: $isCreated, onDismiss: {
////                    FirstScreenView()
////                }) {
//////                    Created()
////
////                }
//
//
//            }
//            .navigationTitle("Include teams")
//            .onAppear {
//                tournament.addPlayers(player: player)
//                vm.updateTournament(tournament: tournament)
//            }
//
//
//
//        }.navigationBarBackButtonHidden()
//
//    }
//}

struct AddCourtsView_Previews: PreviewProvider {
    static var previews: some View {
        AddCourtsView(tournament: c1!)
    }
}
