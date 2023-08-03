//
//  Court.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 24/07/23.
//

import Foundation
import DequeModule

class Court{
    var id: Int
    var name: String
    var line: Deque<Node>
    
    init(id: Int, name: String, line: Deque<Node>) {
        self.id = id
        self.name = name
        self.line = line
    }
    
    func positionInLine(nodeId: Int) -> Int{
        var placement = 1
        for node in line{
            if (node.id == nodeId && node.fineshed == false){
                node.fineshed = true
                return Int(ceil(Double(placement/2)))
            }
            else{
                placement += 1
            }
        }
        return 0
    }
    
    func removeById(nodeId: Int){
        for node in line{
            if (node.id == nodeId){
                line.remove(at: nodeId)
            }
        }
    }
}
