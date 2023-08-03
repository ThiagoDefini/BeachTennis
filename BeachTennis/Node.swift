//
//  Node.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 24/07/23.
//

import Foundation

class Node {
    var id:Int
    var empty:Bool
    var fineshed:Bool = false
    var player:String
    var time:Date
    var court:Court
    var winner:Int
    
    init(id: Int, empty: Bool, player: String, time: Date, court: Court, winner: Int) {
        self.id = id
        self.empty = empty
        self.player = player
        self.time = time
        self.court = court
        self.winner = winner
    }
    
    func removeFromLine(){
        court.line.removeFirst()
        court.line.removeFirst()
    }
}
