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
    var tournamentsCreated:[Int]
    var tournamentsRegistered:[Int]
    var matchesFavorited:[Int]
    
    init(id: Int, name: String, contact: String, tournamentsCreated: [Int], tournamentsRegistered: [Int], matchesFavorited: [Int]) {
        self.id = id
        self.name = name
        self.contact = contact
        self.tournamentsCreated = tournamentsCreated
        self.tournamentsRegistered = tournamentsRegistered
        self.matchesFavorited = matchesFavorited
    }
}
