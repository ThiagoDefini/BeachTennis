//
//  Court.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 24/07/23.
//

import Foundation
import DequeModule
import CloudKit

struct Court: CloudKitableProtocol{
    var id: String
    var name: String
    var line: Deque<String>
    
    var record: CKRecord
    
    init?(record: CKRecord){
        guard let id = record["id"] as? String,
              let name = record["name"] as? String,
              let lineArray = record["line"] as? [String] else { return nil }
        
        let line = Deque(lineArray)
        
        self.id = id
        self.name = name
        self.line = line
        self.record = record
    }
    
    
    init?(name: String, line: Deque<String>) {
        let record = CKRecord(recordType: "Court")
        record["id"] = UUID().uuidString
        record["name"] = name
        record["line"] = Array(line)
        
        self.init(record: record)
    }
    
    func updateRecord(){
        self.record["id"] = self.id
        self.record["name"] = self.name
        self.record["line"] = Array(self.line)
    }
    
    mutating func update( id: String?,  name: String?,  line: Deque<String>?){
        if let id = id {
            self.id = id
        }
        
        if let name = name{
            self.name = name
        }
        
        if let line = line{
            self.line = line
        }
        
        updateRecord()
        
    }
    
    func positionInLine(nodeId: String, completion: @escaping (Int) -> Void){
        var placement = 1
        
        let vm = CloudKitCrudBootcampViewModel()
        
        vm.fetchAllNodesById(ids: Array(line)) { nodes in
            for node in nodes {
                var nodeMut = node
                if (nodeMut.id == nodeId && nodeMut.finished == 0){
                    nodeMut.finished = 1
                    vm.updateNode(node: nodeMut)
                    completion(Int(ceil(Double(placement/2))))
                    return
                }
                else{
                    placement += 1
                }
            }
            completion(0)
        }
    }
    
    mutating func removeByIndex(index: Int){
        let vm = CloudKitCrudBootcampViewModel()
        line.remove(at: index)
        vm.updateCourt(court: self)
    }
    
    mutating func removeById(nodeId: String){
        let vm = CloudKitCrudBootcampViewModel()

        for i in 0...line.count{
            if (line[i] == nodeId){
                line.remove(at: i)
            }
        }
        
        vm.updateCourt(court: self)
    }
}
