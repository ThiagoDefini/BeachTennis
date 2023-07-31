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
        case advanceTonextRound
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
            return tournament.checkCourt(nodeId: node.id)
        }
        return 0
    }
    
    func createTournament (tournamentID: Int, startingTime: Date){
        var tournament = Tournament(id: tournamentID, organizerId: self.id, players: [], courts: [], startingTime: startingTime, ranking: [], tournamentMatches: [])
        tournamentsCreated.append(tournament)
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
                print("Please insert the id of the match and the id of the court you would like to change:")
                tournament.changeCourt(nodeId: aux2,courtId: aux3)
                break
                
            case .advanceTonextRound:
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
