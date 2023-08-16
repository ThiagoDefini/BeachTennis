//
//  Node.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 24/07/23.
//

import Foundation
import CloudKit

struct Node: Hashable, CloudKitableProtocol {
    var id:String
    var empty:Int
    var finished = 0
    var player:String
    var time:Date
    var courtId:String
    var winner:Int
    var record: CKRecord
    
    
    init() {
        self.id = UUID().uuidString
        self.empty = 0
        self.finished = 0
        self.player = ""
        self.time = Date.init()
        self.courtId = ""
        self.winner = 0
        self.record = CKRecord(recordType: "Node")
    }
    
    
    init?(record: CKRecord) {
        guard let id = record["id"] as? String,
              let empty = record["empty"] as? Int,
              let finished = record["finished"] as? Int,
              let player = record["player"] as? String,
              let time = record["time"] as? Date,
              let courtId = record["courtId"] as? String,
              let winner = record["winner"] as? Int else { return nil }
              
        self.id = id
        self.empty = empty
        self.finished = finished
        self.player = player
        self.time = time
        self.courtId = courtId
        self.winner = winner
        self.record = record
              
    }
    
    init?(empty: Int, finished: Int, player: String, time: Date, courtId: String, winner: Int) {
        let record = CKRecord(recordType: "Node")
        record["id"] = UUID().uuidString
        record["empty"] = empty
        record["finished"] = finished
        record["player"] = player
        record["time"] = time
        record["courtId"] = courtId
        record["winner"] = winner
        
        self.init(record: record)
        
    }
    
    mutating func update(id: String? ,empty: Int?, finished: Int?, player: String?, time: Date?, courtId: String?, winner: Int?){
        if let id = id{
            self.id = id
        }
        
        if let empty = empty{
            self.empty = empty
        }
        
        if let finished = finished{
            self.finished = finished
        }
        
        if let player = player{
            self.player = player
        }
        
        if let time = time{
            self.time = time
        }
        
        if let courtId = courtId{
            self.courtId = courtId
        }
        
        if let winner = winner{
            self.winner = winner
        }
        
        updateRecord()
        
    }
    
    func updateRecord(){
//        self.record["id"] = self.id
        self.record["empty"] = self.empty
        self.record["player"] = self.player
        self.record["time"] = self.time
        self.record["courtId"] = self.courtId
        self.record["winner"] = self.winner
    }
    
    
    func removeFromLine(){
        let vm = CloudKitCrudBootcampViewModel()
        vm.fetchCourtById(id: self.courtId) { courtLet in
            var court = courtLet
            court.line.removeFirst()
            court.line.removeFirst()
            
            vm.updateCourt(court: court)
        }
    }
}
