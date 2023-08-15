//
//  Node.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 24/07/23.
//

import Foundation

class Node: Identifiable, Hashable {
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    var hashValue: Int {
        return ObjectIdentifier(self).hashValue
    }
    
    var id:Int
    var empty:Int
    var fineshed = 0
    var player:String
    var time:Date
    var court:Court
    var winner:Int
    
    init(id: Int, empty: Int, player: String, time: Date, court: Court, winner: Int) {
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
