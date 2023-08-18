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
    
    func fetchPerson(){
        guard let userId = vm.userId else { return }
        
        vm.fetchPersonById(id: userId) { person in
            self.person = person
        }
    }
    
    var vm = CloudKitCrudBootcampViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("bege")
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        VStack(alignment: .leading){
                            Text("Hi,")
//                                .bold()
                                .font(.custom("Poppins", size: 28))
                                .foregroundColor(Color("gray"))
                               
                            Text("What we're gonna play today?")
                                .foregroundColor(Color("gray"))
                                .font(.custom("Nunito", size: 16))
                            
                        }.padding(.leading,25)
                        Spacer()
                    }
                    .padding(.bottom)
                    HStack{
                        Text("Championships")
                            .bold()
                            .font(.custom("Poppins", size: 20))
                            .foregroundColor(Color("gray"))
                            
                            .padding(.leading,25)
                        Spacer()
                        
                        
                    }
                    
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
                        
                        
                        .sheet(isPresented: $joinGame, content:{ EnterChampionshipView()})
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
                        .sheet(isPresented: $createGame, content:{ CreateChamp()})
                        
                    }
                    VStack{
                        VStack{
                            HStack{
                                Text("Participating")
                                    .font(.custom("Poppins", size: 20))
                                    .bold()
                                    .foregroundColor(Color("gray"))
                                    .padding(.leading,25)
                                Spacer()
                            }
                            if let person = self.person {
                                if person.tournamentsRegistered.isEmpty {
                                    // vm.fetchAllTournamentsById(ids: person.tournamentsRegistered) { champs in
                                    // ScrollView(.horizontal){
                                    //
                                    // ForEach(champs) { champ in
                                    // Text(champ.id)
                                    // }
                                    // }
                                    // }
                                    
                                } else {
                                    NoGames()
                                        .padding(.top,80)
                                    
                                }
                            }else{
                                NoGames()
                                    .padding(.top,80)
                            }
                        }
                        .padding(.top)
                        
                        VStack{
                            HStack{
                                Text("My created championships")
                                    .font(.custom("Poppins", size: 20))
                                    .bold()
                                    .foregroundColor(Color("gray"))
                                    .padding(.leading,25)
                                Spacer()
                            }
                            if let person = self.person {
                                if person.tournamentsRegistered.isEmpty {
                                    
                                } else {
                                    NoNow()
                                        .padding(.top,60)
                                    
                                }
                            }else{
                                NoNow()
                                    .padding(.top,60)
                                
                            }
                        }
                        .padding(.top,70)
                    }
                }
                .padding(.bottom,50)
                }
                
                .onAppear(perform: self.fetchPerson)
            }
            
        }
    }


struct FirstScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreenView()
    }
}
