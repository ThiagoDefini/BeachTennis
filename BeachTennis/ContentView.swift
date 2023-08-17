//
//  ContentView.swift
//  BeachTennis
//
//  Created by Thiago Defini on 18/07/23.
//
import SwiftUI
import UserNotifications

struct ContentView: View {

    @StateObject var vm = CloudKitCrudBootcampViewModel()
    
    var body: some View {
        FirstScreenView()
            .onAppear{
                vm.setData()
//                if (UserDefaults.standard.bool(forKey: "hasEntered")) == false {
                    
//                    let person = Person(id: vm.userId ?? "", name: vm.userName ?? "", contact: "", tournamentsRegistered: [])
//                    vm.addPerson(person: person!)
                    
//                    UserDefaults.standard.setValue(true, forKey: "hasEntered")
//                }
            }
//            .onChange(of: vm.persons) { persons in
//                createFirstPerson()
//            }
//        PointsCard(tournament: c2, points: GameState(tournament: c2, groupId: 1, players: [0,1]), favorite: 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//func createFirstPerson(){
//    let vm = CloudKitCrudBootcampViewModel()
//
//    guard let userId = vm.userId,
//          let userName = vm.userName else { return }
//
//    if !vm.persons.contains(userId){
//        var person = Person(id: vm.userId ?? "", name: vm.userName ?? "", contact: "", tournamentsRegistered: [])
//    }
//}


var user1 = Person(id: "1",name: "João", contact: "51999999999", tournamentsRegistered: [])

var user2 = Person(id: "2", name: "Maria", contact: "51888888888", tournamentsRegistered: [])

var c1 = Tournament(name: "Sun, Sand, and Smashes", tournamentType: .Tree, organizerId: "1", selectedCourt: 0, nodesCreated: 0, numGroups: 0, players: [], courts: [], startDate: "", endDate: "", startTime: "", endTime: "", ranking: [], tournamentMatches: [], groups: [], location: "Epatur, Cidade Baixa", address: "Rua João Alfredo 300")

var c2 = Tournament(name: "Torneio dos Guri", tournamentType: .Tree, organizerId: "2", selectedCourt: 0, nodesCreated: 0, numGroups: 0, players: [], courts: [], startDate: "", endDate: "", startTime: "", endTime: "", ranking: [], tournamentMatches: [], groups: [], location: "Centro Histórico", address: "Borges de Medeiros 123")

//var gt1 = GameState(tournament: c1?.id ?? "1", groupId: "", players: [])

//var gt2 = GameState(tournament: c2?.id ?? "2", groupId: "", players: [])

var champs: [Tournament] = []

func createChamps(){
    guard let champ1 = c1,
          let champ2 = c2 else { return }
    
    champs.append(champ1)
    champs.append(champ2)
}

var n1 = Node(empty: 0, finished: 0, player: "1", time: .now, courtId: "1", winner: 0)

var n2 = Node(empty: 0, finished: 0, player: "2", time: .now, courtId: "2", winner: 0)

var nods: [Node] = []

func createNods(){
    guard let node1 = n1,
          let node2 = n2 else { return }
    
    nods.append(node1)
    nods.append(node2)
}
