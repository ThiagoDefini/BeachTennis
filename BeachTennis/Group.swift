//
//  Group.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 28/07/23.
//

import Foundation

class Group{
    var id:Int
    var playersInGroup:[Node]
    var matches:[Node]

    init(id: Int, players: [Node], matches: [Node]) {
        self.id = id
        self.playersInGroup = players
        self.matches = matches
    }
    
    func matchMaker(){
        for i in 0...playersInGroup.count-2{
            for j in i+1...playersInGroup.count-1{
                matches.append(playersInGroup[i])
                matches.append(playersInGroup[j])
            }
        }
    }
    
    func findNode(id:Int) -> Node{
        for node in playersInGroup{
            if (node.id == id){
                return node
            }
        }
        return Node(id: 0, empty: false, player: "", time: Date.init(), court: Court(id: 0, name: "", line: []), winner: 0)
    }
    
}
