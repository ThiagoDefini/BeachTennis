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
}
