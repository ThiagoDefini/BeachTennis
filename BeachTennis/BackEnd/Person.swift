//
//  Person.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 24/07/23.
//

import Foundation
import CloudKit

struct Person: CloudKitableProtocol{
    var id: String
    var name: String
    var contact: String
    var tournamentsCreated:[String]
    var tournamentsRegistered:[String]
    var playersFavorited:[String] //Node
    
    var record: CKRecord
    
    init?(record: CKRecord) {
        guard let id = record["id"] as? String,
              let name = record["name"] as? String,
              let contact = record["contact"] as? String,
              let tournamentsCreated = record["tournamentsCreated"] as? [String],
              let tournamentsRegistered = record["tournamentsRegistered"] as? [String],
              let playersFavorited = record["playersFavorited"] as? [String] else { return nil }
        
        self.id = id
        self.name = name
        self.contact = contact
        self.tournamentsCreated = tournamentsCreated
        self.tournamentsRegistered = tournamentsRegistered
        self.playersFavorited = playersFavorited
        self.record = record
    }
    
    
    init?(name: String, contact: String, tournamentsCreated: [String], tournamentsRegistered: [String], playersFavorited: [String]){
        let record = CKRecord(recordType: "Person")
        record["id"] = UUID().uuidString
        record["name"] = name
        record["contact"] = contact
        record["tournamentsCreated"] = tournamentsCreated
        record["tournamentsRegistered"] = tournamentsRegistered
        record["playersFavorited"] = playersFavorited
        
        self.init(record: record)
    }
    
    func updateRecord(){
        self.record["id"] = self.id
        self.record["name"] = self.name
        self.record["contact"] = self.contact
        self.record["tournamentsCreated"] = self.tournamentsCreated
        self.record["tournamentsRegistered"] = self.tournamentsRegistered
        self.record["playersFavorited"] = self.playersFavorited
    }
    
    enum EditOptions{
        case addPlayer
        case addCourt
        case changeCourt
        case advanceTonextRoundTree
    }
    
    mutating func favoritePlayer(nodeFavoritedId: String, tournamentId: String){
        let vm = CloudKitCrudBootcampViewModel()
        
        playersFavorited.append(nodeFavoritedId)
        
        vm.updatePerson(person: self)
//        for tournament in tournamentsRegistered {
//            if(tournament.id == tournamentId){
//                for node in tournament.tournamentMatches{
//                    if (node.id == nodeFavoritedId){
//                        playersFavorited.append(node)
//                    }
//                }
//            }
//        }
        
    }

//    func gamesRemaining (tournament: String) -> Int{
//        let vm = CloudKitCrudBootcampViewModel()
//
//        vm.fetchTournamentById(id: tournament) { tournament in
//            tournament.checkCourtTree(nodeId: playersFavorited.first) { <#Int#> in
//                <#code#>
//            }
//        }
//
//        for node in playersFavorited{
//            return tournament.checkCourtTree(nodeId: node.id)
//        }
//        return 0
//    }

    mutating func createTournament (name: String, tournamentType: TournamentTypes, startingTime: Date, endingTime: Date ,location: String, address: String){
        let vm = CloudKitCrudBootcampViewModel()
        
        guard let tournament = Tournament(name: name, tournamentType: tournamentType, organizerId: self.id, selectedCourt: 0, nodesCreated: 0, numGroups: 0, players: [], courts: [], startingTime: startingTime, endingTime: endingTime, ranking: [], tournamentMatches: [], groups: [], location: location, address: address) else { return }
        
        vm.addTournament(newTournament: tournament)
        
        tournamentsCreated.append(tournament.id)
        vm.updatePerson(person: self)
    }

//    func printTournament(tournament: Tournament){
//        var line = 0
//        for node in tournament.tournamentMatches{
//            line += 1
//            let sonNode1 = tournament.tournamentMatches[node.id*2]
//            let sonNode2 = tournament.tournamentMatches[node.id*2+1]
//            if (node.empty == 1 && sonNode1.empty == 1){
//                print("\n "+String(line)+". this node is not associated with any matches")
//            if (node.empty == 1 && sonNode1.empty == 0){
//                print("\n "+String(line)+". this node represents the match between: "+String(sonNode1.player)+" and "+String(sonNode2.player))
//                }
//            if (node.empty == 0){
//                print("\n "+String(line)+". this node represents the players: "+String(node.player))
//                }
//            }
//        }
//    }

//    func editTournament (tournament: Tournament, editSelected: EditOptions){
//        if(tournament.organizerId == self.id){
//            let aux1 = ""
//            let aux2 = 0
//            let aux3 = 0
//            print("Please select the kind of edit you would like to make:")
//            switch editSelected{
//
//            case .addPlayer:
//                print("Please insert the name of the team you would like to add:")
//                tournament.addPlayers(player: aux1)
//                break
//
//            case .addCourt:
//                print("Please insert the name of the court you would like to add:")
//                tournament.addPlayers(player: aux1)
//                break
//
//            case .changeCourt:
//                print("Please insert the id of the match/group and the id of the court you would like to change:")
//                tournament.changeCourt(nodeId: aux2, courtId: aux3, groupId: aux2)
//                break
//
//            case .advanceTonextRoundTree:
//                print("Advancing to the next stage of the tournament...")
//                tournament.updateTournamentTree()
//                break
//            }
//        }
//        else{
//            print("You do not have permission to edit this event")
//        }
//
//    }
}
