//
//  PlayingView.swift
//  BeachTennis
//
//  Created by Thiago Defini on 03/08/23.
//

import SwiftUI

struct PlayingView: View {
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView{
            VStack{
                if champs.isEmpty{
                    Image("jiji")
                        .resizable()
                        .frame(width: 350, height: 182)
                        .cornerRadius(16)
                        .offset(y: -60)
                }else{
                    ForEach(champs){ champ in
                        ChampionshipRow(champ: champ)
                    }
                }
                
                Spacer()
                
                Button("Enter championship"){
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    EnterChampionshipView()
//                    ChampionshipDetailsView()
                }
                .frame(width: 350, height: 64)
                .background(Color("blue"))
                .cornerRadius(16)
                .foregroundColor(.white)
                .padding()
                
                
            }
            
            .navigationTitle("Playing")
            
        }

    }
}

var user1 = User(id: 1, name: "João", contact: "51999999999", tournamentsCreated: [], tournamentsRegistered: [], playersFavorited: [])

var user2 = User(id: 2, name: "Maria", contact: "51888888888", tournamentsCreated: [], tournamentsRegistered: [], playersFavorited: [])

var c1: Tournament = Tournament(id: 12345, name: "Sun, Sand, and Smashes", tournamentType: .Tree, organizerId: 1, players: [], courts: [], startingTime: .now, ranking: [], tournamentMatches: [], groups: [], location: "Pucrs", adress: "Rua joão alfredo 277")

var c2: Tournament = Tournament(id: 54321, name: "Torneio dos Guri", tournamentType: .Group, organizerId: 2, players: [], courts: [], startingTime: .now, ranking: [], tournamentMatches: [Node(id: 1, empty: 0, player: "JoeShmoes", time: Date.init(), court: Court(id: 1, name: "Ipsum", line: []), winner: 0)], groups: [], location: "Centro Histórico", adress: "Borges de Medeiros 123")

var champs: [Tournament] = [c1,c2]

struct PlayingView_Previews: PreviewProvider {
    static var previews: some View {
        PlayingView()
    }
}
