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

class GameState: ObservableObject {
    @Published var tournament: Tournament
    @Published var groupId: Int
    @Published var score:[points] = [.Love,.Love]
    @Published var players:[Int]
    @Published var sets:[Int] = [0,0]
    
    init(tournament: Tournament, groupId: Int, players: [Int]) {
        self.tournament = tournament
        self.groupId = groupId
        self.players = players
    }
    
    func printPoints(i: Int) -> String{
        switch score[i]{
            case .Love:
                return "0"
            case .Fifthteen:
                return "15"
            case .Thirty:
                return "30"
            case .Fourty:
                return "40"
            case .Game:
                return "Game"
        }
    }
    
    func pointsIncrease(i: Int){
        print()
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
                    print(sets[i])
                    if(sets[i] == 20){
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
