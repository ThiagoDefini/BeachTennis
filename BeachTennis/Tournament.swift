//
//  Tournament.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 24/07/23.
//

import Foundation

class Tournament{
    var id: Int
    var organizerId: Int
    var SelectedCourt: Int = 0
    var tournamentMatches: [Node]
    var players: [String]
    var courts: [Court]
    var startingTime: Date
    var ranking: [Node]
    
    init(id: Int, organizerId: Int, players: [String], courts: [Court], startingTime: Date, ranking: [Node], tournamentMatches: [Node]){
        self.id = id
        self.organizerId = organizerId
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
        courts.append(Court(id: court.count, name: court, line:[]))
    }
    
    func selectCourt() -> Court{
        if (SelectedCourt == courts.count+1){
            SelectedCourt = 0
        }
        let courtSelected = courts[SelectedCourt]
        return courtSelected
    }
    
    //seleciona uma quadra para uma partida
    func changeCourt(nodeId: Int, courtId: Int){
        for court in courts {
            if (court.id == courtId){
                tournamentMatches[(nodeId*2)-1].court = court
                tournamentMatches[(nodeId*2)].court = court
                court.line.append(tournamentMatches[(nodeId*2)-1])
                court.line.append(tournamentMatches[(nodeId*2)])
            }
        }
    }
    
    //tournamentMatches sai dessa funcao como uma arvore com os pais vazios cujas folhas sao
    //todos os jogadores com suas respectivas quadras, ou seja, a configuracao inicial do torneio
    func createTournament(){
        self.id = 10
        var match = 0
        for i in 1...(players.count * 2)-1{
            if(i < players.count){
                tournamentMatches.append(Node(id: tournamentMatches.count+1, empty: true, player: "", time: Date.init(), court: Court.init(id: 0, name: "", line:[]), winner: false))
            }
            else{
                tournamentMatches.append(Node(id: tournamentMatches.count+1, empty: false, player: players[i - players.count], time: Date.init(), court: self.selectCourt(), winner: false))
                match += 1
                if(match == 2){
                    SelectedCourt += 1
                    match = 0
                }
            }
        }
        
    }
    
    func checkCourt(nodeId: Int) -> Int{
        for node in tournamentMatches{
            if(node.id == nodeId){
                var auxCourt = node.court
                if(auxCourt.positionInLine(nodeId: nodeId) != 0){
                    return auxCourt.positionInLine(nodeId: nodeId)
                }
                else{
                    return 0
                }
            }
        }
        return 0
    }
    
    func selectWinner(id: Int){
        tournamentMatches[id].winner = true
    }
    
    //atualiza o torneio e move ele para a próxima etapa
    func updateTournament(){
        for node in tournamentMatches{
            var aux = Int(floor(Double(node.id/2)))
            if(node.winner == true && tournamentMatches[aux-1].empty == true){
                node.court.line.popFirst()
                tournamentMatches[aux-1] = node
                node.winner = false
                tournamentMatches[aux-1].winner = false
            }
            if(node.id == 0 && node.empty == false){
                createRanking()
                print(ranking)
            }
        }
    }
    
    //cria um ranking com base no torneio concluido
    func createRanking(){
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
            }
        }
    }
}
