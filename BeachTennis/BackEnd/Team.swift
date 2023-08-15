//
//  Group.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 28/07/23.
//

import Foundation
import DequeModule
import CloudKit

struct Team: CloudKitableProtocol{
    var id: String
    var playersInGroup:[String] //Node
    var matches:Deque<String> // Node

    
    var record: CKRecord
    
    init?(record: CKRecord) {
        guard let id = record["id"] as? String,
              let playersInGroup = record["playersInGroup"] as? [String],
              let matchesArray = record["matches"] as? [String] else { return nil}
              
        self.id = id
        self.playersInGroup = playersInGroup
        self.matches = Deque(matchesArray)
        self.record = record
    }
    
    init?(playersInGroup: [String], matches: Deque<String>){
        let record = CKRecord(recordType: "Team")
        record["id"] = UUID().uuidString
        record["playersInGroup"] = playersInGroup
        record["matches"] = Array(matches)
        
        self.init(record: record)
    }
    
    func updateRecord(){
        self.record["id"] = self.id
        self.record["playersInGroup"] = self.playersInGroup
        self.record["matches"] = Array(self.matches)
    }
    
    
    mutating func matchMaker(){
        let vm = CloudKitCrudBootcampViewModel()
        
        for i in 0...playersInGroup.count-2{
            for j in i+1...playersInGroup.count-1{
                matches.append(playersInGroup[i])
                matches.append(playersInGroup[j])
            }
        }
        vm.updateTeam(team: self)
    }
    
//    func findNode(id:String) -> Node{
//        var vm = CloudKitCrudBootcampViewModel()
//
//        for node in playersInGroup{
//            if (node == id){
//                vm.fetchNodeById(id: node) { nodes in
//                    <#code#>
//                }
//                return node
//            }
//        }
//        return Node(id: 0, empty: 0, player: "", time: Date.init(), court: Court(id: 0, name: "", line: []), winner: 0)
//    }
    
}
