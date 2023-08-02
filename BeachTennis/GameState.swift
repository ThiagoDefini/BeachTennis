//
//  GameState.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 01/08/23.
//

import Foundation

enum points{
    case Love
    case Fifthteen
    case Thirty
    case Fourty
    case Game
}

class GameState{
    var tournament: Tournament
    var groupId: Int
    var score:[points] = [.Love,.Love]
    var players:[Int]
    var sets:[Int] = [0,0]
    
    init(tournament: Tournament, groupId: Int, players: [Int]) {
        self.tournament = tournament
        self.groupId = groupId
        self.players = players
    }
    
    func pointsIncrease(nodeId: Int){
        for i in 0...1{
            if(players[i] == nodeId){
                switch score[i]{
                case .Love:
                    score[i] = .Fifthteen
                    break
                case .Fifthteen:
                    score[i] = .Thirty
                    break
                case .Thirty:
                    score[i] = .Fourty
                    break
                case .Fourty:
                    score[i] = .Game
                    sets[i] += 1
                    if(sets[i] == 2){
                        if(tournament.tournamentType == .Group){
                            tournament.selectWinnerGroup(groupId: groupId, nodeId: players[i])
                        }
                        else{
                            tournament.selectWinnerTree(id: players[i])
                        }
                    }
                    score[0] = .Love
                    score[1] = .Love
                    break
                case .Game:
                    break

                }
            }
        }
    }
}
