//
//  User.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 24/07/23.
//

import Foundation

class User{
    var id: Int
    var name: String
    var contact: String
    var tournamentsCreated:[Tournament]
    var tournamentsRegistered:[Tournament]
    var playersFavorited:[Node]
    
    init(id: Int, name: String, contact: String, tournamentsCreated: [Tournament], tournamentsRegistered: [Tournament], playersFavorited: [Node]) {
        self.id = id
        self.name = name
        self.contact = contact
        self.tournamentsCreated = tournamentsCreated
        self.tournamentsRegistered = tournamentsRegistered
        self.playersFavorited = playersFavorited
    }
    
    enum editOptions{
        case addPlayer
        case addCourt
        case changeCourt
        case advanceTonextRoundTree
    }
    
    func favoritePlayer(nodeFavoritedId: Int, tournamentId: Int){
        for tournament in tournamentsRegistered {
            if(tournament.id == tournamentId){
                for node in tournament.tournamentMatches{
                    if (node.id == nodeFavoritedId){
                        playersFavorited.append(node)
                    }
                }
            }
        }
    }
    
    func gamesRemaining (tournament: Tournament) -> Int{
        for node in playersFavorited{
            return tournament.checkCourtTree(nodeId: node.id)
        }
        return 0
    }
    
    func createTournament (tournamentType: tournamentTypes, tournamentID: Int, startingTime: Date){
        let tournament = Tournament(id: tournamentID, tournamentType: tournamentType, organizerId: self.id, players: [], courts: [], startingTime: startingTime, ranking: [], tournamentMatches: [],groups: [])
        tournamentsCreated.append(tournament)
    }
    
    func printTournament(tournament: Tournament){
        var line = 0
        for node in tournament.tournamentMatches{
            line += 1
            let sonNode1 = tournament.tournamentMatches[node.id*2]
            let sonNode2 = tournament.tournamentMatches[node.id*2+1]
            if (node.empty == true && sonNode1.empty == true){
                print("\n "+String(line)+". this node is not associated with any matches")
            if (node.empty == true && sonNode1.empty == false){
                print("\n "+String(line)+". this node represents the match between: "+String(sonNode1.player)+" and "+String(sonNode2.player))
                }
            if (node.empty == false){
                print("\n "+String(line)+". this node represents the players: "+String(node.player))
                }
            }
        }
    }
    
    func editTournament (tournament: Tournament, editSelected: editOptions){
        if(tournament.organizerId == self.id){
            let aux1 = ""
            let aux2 = 0
            let aux3 = 0
            print("Please select the kind of edit you would like to make:")
            switch editSelected{
                
            case .addPlayer:
                print("Please insert the name of the team you would like to add:")
                tournament.addPlayers(player: aux1)
                break
                
            case .addCourt:
                print("Please insert the name of the court you would like to add:")
                tournament.addPlayers(player: aux1)
                break
                
            case .changeCourt:
                print("Please insert the id of the match/group and the id of the court you would like to change:")
                tournament.changeCourt(nodeId: aux2, courtId: aux3, groupId: aux2)
                break
                
            case .advanceTonextRoundTree:
                print("Advancing to the next stage of the tournament...")
                tournament.updateTournamentTree()
                break
            }
        }
        else{
            print("You do not have permission to edit this event")
        }
        
    }
}
