//
//  ContentView.swift
//  BeachTennis
//
//  Created by Thiago Defini on 18/07/23.
//
import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        CreateChamp()
//        Created(code: "61A86C2B-0ECF-4918-A193-286DE1F630E7")
//        CloudKitCrudBootcamp()
//        PointsCard(tournament: c2, points: GameState(tournament: c2, groupId: 1, players: [0,1]), favorite: 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


var user1 = Person(name: "João", contact: "51999999999", tournamentsCreated: [], tournamentsRegistered: [], playersFavorited: [])

var user2 = Person(name: "Maria", contact: "51888888888", tournamentsCreated: [], tournamentsRegistered: [], playersFavorited: [])

var c1 = Tournament(name: "Sun, Sand, and Smashes", tournamentType: .Tree, organizerId: "1", selectedCourt: 0, nodesCreated: 0, numGroups: 0, players: [], courts: [], startingTime: .now, endingTime: .now, ranking: [], tournamentMatches: [], groups: [], location: "Epatur, Cidade Baixa", address: "Rua João Alfredo 300")

var c2 = Tournament(name: "Torneio dos Guri", tournamentType: .Tree, organizerId: "2", selectedCourt: 0, nodesCreated: 0, numGroups: 0, players: [], courts: [], startingTime: .now, endingTime: .now, ranking: [], tournamentMatches: [], groups: [], location: "Centro Histórico", address: "Borges de Medeiros 123")

var champs: [Tournament?] = [c1,c2]

