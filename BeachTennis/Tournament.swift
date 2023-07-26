//
//  Tournament.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 24/07/23.
//

import Foundation

class Tournament{
    var id: Int
    var SelectedCourt: Int = 0
    var tournamentMatches: [Node]
    var players: [String]
    var courts: [Court]
    var startingTime: Date
    var ranking: [Node]
    
    init(id: Int, players: [String], courts: [Court], startingTime: Date, ranking: [Node], tournamentMatches: [Node]){
        self.id = id
        self.tournamentMatches = tournamentMatches
        self.players = players
        self.courts = courts
        self.startingTime = startingTime
        self.ranking = ranking
    }
    
    func addPlayers(player: String){
        players.append(player)
    }
    
    func addCourts(court:String){
        courts.append(Court(id: court.count, name: court))
    }
    
    func selectCourt() -> Court{
        if (SelectedCourt == courts.count-1){
            SelectedCourt = 0
        }
        var courtSelected = courts[SelectedCourt]
        return courtSelected
    }
    
    //seleciona uma quadra para uma partida
    func changeCourt(courtId: Int, nodeId: Int){
        for court in courts {
            if (court.id == courtId){
                tournamentMatches[nodeId].court = court
            }
        }
    }
    
    func selectWinner(id: Int){
        tournamentMatches[id].winner = true
    }
    
    //tournamentMatches sai dessa funcao como uma arvore com os pais vazios cujas folhas sao
    //todos os jogadores com suas respectivas quadras, ou seja, a configuracao inicial do torneio
    func createTournament(){
        self.id = 10
        var auxPlayers = 0
        // -1 se players.count for par e +0 se for impar
        if(players.count % 2 == 0){
            auxPlayers = (players.count * 2)-1
        }
        else{
            auxPlayers = (players.count * 2)
        }
        
        for i in 1...(auxPlayers){
            if(i < players.count){
                tournamentMatches.append(Node(id: tournamentMatches.count, empty: true, player: "", time: Date.init(), court: Court.init(id: 0, name: ""), winner: false))
            }
            else{
                tournamentMatches.append(Node(id: tournamentMatches.count, empty: false, player: players[i - players.count], time: Date.init(), court: self.selectCourt(), winner: false))
                SelectedCourt+=1
            }
        }
        
    }
    
    func updateTournament(){
        for node in tournamentMatches{
            if(node.winner == true){
                if(node.id < 8){
                    var auxRank: Bool = true
                    for i in ranking{
                        if (i.id == node.id){
                            auxRank = false
                        }
                    }
                    if(auxRank == true){
                        ranking.append(node)
                    }
                }
                tournamentMatches[node.id/2] = node
                node.winner = false
                tournamentMatches[node.id/2].winner = false
            }
            if(node.id == 0 && node.empty == false){
               print(ranking)
            }
        }
    }
}
