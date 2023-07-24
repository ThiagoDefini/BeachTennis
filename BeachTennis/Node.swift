//
//  Node.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 24/07/23.
//

import Foundation

class Node {
    var empty:Bool 
    var player:String
    var time:Date
    var court:Court
    var winner:Bool
    
    init(empty: Bool, player: String, time: Date, court: Court, winner: Bool) {
        self.empty = empty
        self.player = player
        self.time = time
        self.court = court
        self.winner = winner
    }
}
