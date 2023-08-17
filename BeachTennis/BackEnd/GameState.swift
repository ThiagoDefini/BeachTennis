////
////  GameState.swift
////  BeachTennis
////
////  Created by Lucas Cunha on 01/08/23.
////
//
//import Foundation
//import CloudKit
//
//enum Points: String, Codable{
//    case Love
//    case Fifthteen
//    case Thirty
//    case Fourty
//    case Game
//    
//    static func fromString(_ string: String) -> Points?{
//        return Points(rawValue: string)
//    }
//}
//
//struct GameState: CloudKitableProtocol{
//    var tournament: String
//    var groupId: String
//    var score:[Points] = [.Love,.Love]
//    var players:[String]
//    var sets:[Int] = [0,0]
//    
//    var record: CKRecord
//    
//    init?(record: CKRecord) {
//        guard let tournament = record["tournament"] as? String,
//              let groupId = record["groupId"] as? String,
//              let players = record["players"] as? [String],
//              let sets = record["sets"] as? [Int] else { return nil }
//        
////        guard var score1 = points(rawValue: scoreString[0]),
////              var score2 = points(rawValue: scoreString[1]) else { return nil }
////        var score = [points]
////
////        score[0] = score1
////        score[1] = score2
//
//        self.tournament = tournament
//        self.groupId = groupId
//        self.score = [.Love,.Love]
//        self.players = players
//        self.sets = sets
//        self.record = record
//    }
//    
//    init?(tournament: String, groupId: String, players: [String]) {
//        let record = CKRecord(recordType: "GameState")
//        record["tournament"] = tournament
//        record["groupId"] = groupId
//        record["score"] = [Points.Love.rawValue, Points.Love.rawValue]
//        record["players"] = players
//        record["sets"] = [0,0]
//        
//        self.init(record: record)
//        
//    }
//    
//    func updateRecord(){
//        self.record["tournament"] = self.tournament
//        self.record["groupId"] = self.groupId
////        self.record["score"] = self.score
//        self.record["players"] = self.players
//        self.record["sets"] = self.sets
//    }
//    
////    mutating func pointsIncrease(nodeId: Int){
////        for i in 0...1{
////            if(players[i] == nodeId){
////                switch score[i]{
////                case .Love:
////                    score[i] = .Fifthteen
////                    break
////                case .Fifthteen:
////                    score[i] = .Thirty
////                    break
////                case .Thirty:
////                    score[i] = .Fourty
////                    break
////                case .Fourty:
////                    score[i] = .Game
////                    sets[i] += 1
////                    if(sets[i] == 2){
////                        if(tournament.tournamentType == .Group){
//////                            tournament.selectWinnerGroup(groupId: groupId, nodeId: players[i])
////                        }
////                        else{
//////                            tournament.selectWinnerTree(id: players[i])
////                        }
////                    }
////                    score[0] = .Love
////                    score[1] = .Love
////                    break
////                case .Game:
////                    break
////
////                }
////            }
////        }
////    }
//}
