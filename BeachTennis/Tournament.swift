//
//  Tournament.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 24/07/23.
//

import Foundation

class Tournament: Identifiable{
    var id: Int
    var name: String
    var tournamentType: tournamentTypes
    var organizerId: Int
    var selectedCourt = 0
    var nodesCreated = 0
    var numGroups = 0
    var players: [String]
    var courts: [Court]
    var startingTime: Date
    var ranking: [Node]
    var tournamentMatches: [Node]
    var groups: [Team]
    var location: String
    var adress: String

    
    init(id: Int, name: String, tournamentType: tournamentTypes, organizerId: Int, players: [String], courts: [Court], startingTime: Date, ranking: [Node], tournamentMatches: [Node], groups: [Team], location: String, adress: String){
        self.id = id
        self.name = name
        self.tournamentType = tournamentType
        self.organizerId = organizerId
        self.tournamentMatches = tournamentMatches
        self.players = players
        self.courts = courts
        self.startingTime = startingTime
        self.ranking = ranking
        self.groups = groups
        self.location = location
        self.adress = adress
    }
    
    func addPlayers(player: String){
        players.append(player)
    }
    
    func addCourts(court:String){
        courts.append(Court(id: court.count, name: court, line:[]))
    }
    
    func selectCourt(nodeId: Int) -> Court{
        if (selectedCourt == courts.count+1){
            selectedCourt = 0
        }
        let courtSelected = courts[selectedCourt]
        courts[selectedCourt].line.append(tournamentMatches[nodeId])
        return courtSelected
    }
    
    //seleciona uma quadra para uma partida
    func changeCourt(nodeId: Int, courtId: Int, groupId: Int){
        if(tournamentType == .Tree){
            for court in courts {
                if (court.id == courtId){
                    tournamentMatches[(nodeId*2)].court.removeById(nodeId: nodeId*2)
                    tournamentMatches[(nodeId*2)].court.removeById(nodeId: nodeId*2+1)
                    tournamentMatches[(nodeId*2)].court = court
                    tournamentMatches[(nodeId*2)+1].court = court
                    court.line.append(tournamentMatches[(nodeId*2)])
                    court.line.append(tournamentMatches[(nodeId*2)+1])
                }
            }
        }
        else{
            for court in courts {
                if (court.id == courtId){
                    for i in  0...groups[groupId-1].playersInGroup.count-1{
                        if (groups[groupId-1].playersInGroup[i].id == nodeId){
                            if(nodeId%2 == 1){
                                groups[groupId-1].playersInGroup[i].court.removeById(nodeId: groups[groupId-1].playersInGroup[i].id)
                                groups[groupId-1].playersInGroup[i+1].court.removeById(nodeId: groups[groupId-1].playersInGroup[i+1].id)
                                groups[groupId-1].playersInGroup[i].court = court
                                groups[groupId-1].playersInGroup[i+1].court = court
                                court.line.append(groups[groupId-1].playersInGroup[i])
                                court.line.append(groups[groupId-1].playersInGroup[i+1])
                            }
                            else{
                                if(nodeId%2 == 1){
                                    groups[groupId-1].playersInGroup[i-1].court.removeById(nodeId: groups[groupId-1].playersInGroup[i-1].id)
                                    groups[groupId-1].playersInGroup[i].court.removeById(nodeId: groups[groupId-1].playersInGroup[i].id)
                                    groups[groupId-1].playersInGroup[i-1].court = court
                                    groups[groupId-1].playersInGroup[i].court = court
                                    court.line.append(groups[groupId-1].playersInGroup[i-1])
                                    court.line.append(groups[groupId-1].playersInGroup[i])
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func checkCourtTree(nodeId: Int) -> Int{
        for node in tournamentMatches{
            if(node.id == nodeId){
                let auxCourt = node.court
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
    
    func selectWinnerTree(id: Int){
        tournamentMatches[id].winner += 1
        tournamentMatches[id].removeFromLine()
    }
    
    func selectWinnerGroup(groupId: Int, nodeId: Int){
        groups[groupId].findNode(id: nodeId).winner += 1
        groups[groupId].matches.removeFirst()
        groups[groupId].matches.removeFirst()
        groups[groupId].findNode(id: nodeId-1).removeFromLine()
    }
    
    func createOccupiedNode(num: Int) -> Node{
        nodesCreated += 1
        return Node(id: nodesCreated, empty: false, player: players[num], time: Date.init(), court: self.selectCourt(nodeId: tournamentMatches.count+1), winner: 0)
        
    }
    
    //tournamentMatches sai dessa funcao como uma arvore com os pais vazios cujas folhas sao
    //todos os jogadores com suas respectivas quadras, ou seja, a configuracao inicial do torneio
    func createTournamentTree(){
        self.id = 10
        var match = 0
        for i in 1...(players.count * 2)-1{
            if(i < players.count){
                nodesCreated += 1
                tournamentMatches.append(Node(id: nodesCreated, empty: true, player: "", time: Date.init(), court: Court.init(id: 0, name: "", line:[]), winner: 0))
            }
            else{
                tournamentMatches.append(createOccupiedNode(num: i - players.count))
                match += 1
                if(match == 2){
                    selectedCourt += 1
                    match = 0
                }
            }
        }
        
    }
    
    //atualiza o torneio e move ele para a próxima etapa
    func updateTournamentTree(){
        for node in tournamentMatches{
            let aux = Int(floor(Double(node.id/2)))
            if(node.winner >= 1 && tournamentMatches[aux-1].empty == true){
                node.winner = 0
                tournamentMatches[aux-1] = node
            }
            if(node.id == 0 && node.empty == false){
                createRanking()
                print(ranking)
            }
        }
    }
    
    //rever o default
    func createTournamentGroup(){
        self.id = 10
        let playersTotal = players.count
        switch playersTotal {
        case 3...5:
            for i in 0...playersTotal-1{
                let newGroup = Team(id: numGroups, players: [createOccupiedNode(num: i)], matches: [])
                groups.append(newGroup)
                selectedCourt += 1
            }
            break
        default:
            var offset = playersTotal%3
            var adjustment = 0
            for i in 0...Int(floor(Double(playersTotal/3))) - 1{
                numGroups += 1
                if (offset > 0){
                    let newGroup = Team(id: numGroups, players: [createOccupiedNode(num: i*3+adjustment),createOccupiedNode(num: i*3+1+adjustment),createOccupiedNode(num: i*3+2+adjustment),createOccupiedNode(num: i*3+3+adjustment)], matches: [])
                    groups.append(newGroup)
                    newGroup.matchMaker()
                    selectedCourt += 1
                    offset -= 1
                    adjustment += 1
                    groups.append(newGroup)
                }
                else{
                    let newGroup = Team(id: numGroups, players: [createOccupiedNode(num: i*3+adjustment),createOccupiedNode(num: i*3+1+adjustment),createOccupiedNode(num: i*3+2+adjustment)], matches: [])
                    groups.append(newGroup)
                    newGroup.matchMaker()
                    selectedCourt += 1
                    groups.append(newGroup)
                }
            }
            break
        }
    }
    
    func updateTournamentGroup(){
        var nextBatch: [String] = []
        for group in groups{
            var highestWins = Node(id: 0, empty: false, player: "", time: Date.init(), court: Court(id: 0, name: "", line: []), winner: 0)
            for player in group.playersInGroup {
                if(player.winner > highestWins.winner){
                    highestWins = player
                }
            }
            nextBatch.append(highestWins.player)
        }
        players = nextBatch
        createTournamentGroup()
    }
    
    //cria um ranking com base no torneio concluido
    func createRanking(){
        for node in tournamentMatches{
            if(node.winner >= 1){
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
