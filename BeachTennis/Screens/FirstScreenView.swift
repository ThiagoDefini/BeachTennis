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
    
//    func fetchPerson(){
//        vm.findPerson { person in
//            self.person = person
//        }
//    }
//
//    func findTournaments(ids: [String]){
//        vm.fetchAllTournamentsById(ids: ids) { tournaments in
//            self.champs = tournaments
//        }
//    }
    
//    init(){
//        fetchPerson()
//    }
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("bege")
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        VStack(alignment: .leading){
                            Text("Hi,")
                                .font(.system(size: 28))
                                .foregroundColor(Color("gray"))
                            Text("What we're gonna play today?")
                                .foregroundColor(Color("gray"))
                                .font(.system(size: 16))
                        }
                        PhotoPicker2()
                            .offset(x: 50)
                        
                    }
                    .offset(x: -20 ,y: -150)
                    VStack(alignment: .leading){
                        Text("Championships")
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(Color("gray"))
                    }
                    .offset(x: -110, y: -120)
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
                                .environmentObject(vm)
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
                                .environmentObject(vm)
                                .onAppear{
                                    vm.updateData()
                                }
                            
                            
                        })
                        
                    }
                    .offset(y: -110)
                    VStack(alignment: .leading){
                        HStack{
                            Text("My championships")
                                .font(.system(size: 20))
                                .bold()
                                .foregroundColor(Color("gray"))
                        }
                        .offset( y: -90)
                        
                        
                        if let person = self.vm.person {
                            if !vm.ownerTournaments.isEmpty {
                                ScrollView(.horizontal){
                                    HStack{
                                        //                                    if let championships = vm.ownerTournaments {
                                        ForEach(vm.ownerTournaments) { champ in
                                            TournamentCard(tournament: champ)
                                        }
                                        //                                    }
                                    }
                                }
                                
                                
                            } else {
                                
                                NoGames()
                                    .offset(y: -60)
                            }
                        }else{
                            NoGames()
                                .offset(y: -60)
                            Text("ajndaoisndlaindilandalsidnalindlaisndliadnila")
                        }
                    }
                    VStack(alignment: .leading){
                        Text("What's happening now?")
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(Color("gray"))
                    }
                    .offset(x: -75, y: -20)
                    
                    if let person = self.person {
                        if !person.tournamentsRegistered.isEmpty {
                            ScrollView(.horizontal){
                                if let championships = self.champs{
                                    ForEach(championships) { champ in
                                        TournamentCard(tournament: champ)
                                    }
                                }
                            }
                        } else {
                            NoNow()
                                .offset(y: 40)
                        }
                    }else{
                        NoNow()
                            .offset(y: 40)
                    }
                    
                }
            }
            //.onAppear(perform: self.fetchPerson)
        }
//        .onAppear {
//            self.vm.setData()
//        }
    }
}

struct FirstScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreenView()
    }
}
