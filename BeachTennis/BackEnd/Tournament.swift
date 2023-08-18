//
//  Tournament.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 24/07/23.
//

import Foundation
import CloudKit

struct Tournament: Identifiable, CloudKitableProtocol{
    var id: String
    var name: String
    var tournamentType: TournamentTypes
    var organizerId: String
    var selectedCourt = 0
    var nodesCreated = 0
    var numGroups = 0
    var players: [String]
    var courts: [String] //Court
    var startDate: String
    var endDate: String
    var startTime: String
    var endTime: String
    var ranking: [String] //Node
    var tournamentMatches: [String] //Node
    var groups: [String] //Team
    var location: String
    var address: String
    
    var record: CKRecord
    
    init(){
        self.id = ""
        self.name = ""
        self.tournamentType = .Tree
        self.organizerId = ""
        self.selectedCourt = 0
        self.nodesCreated = 0
        self.numGroups = 0
        self.players = []
        self.courts = []
        self.startDate = ""
        self.endDate = ""
        self.startTime = ""
        self.endTime = ""
        self.ranking = []
        self.tournamentMatches = []
        self.groups = []
        self.location = ""
        self.address = ""
        self.record = CKRecord(recordType: "Tournament")
        
        record["id"] = id
        record["name"] = name
        record["tournamentType"] = tournamentType.rawValue
        record["organizerId"] = organizerId
        record["selectedCourt"] = selectedCourt
        record["nodesCreated"] = nodesCreated
        record["numGroups"] = numGroups
        record["players"] = players
        record["courts"] = courts
        record["startDate"] = startDate
        record["endDate"] = endDate
        record["startTime"] = startTime
        record["endTime"] = endTime
        record["ranking"] = ranking
        record["tournamentMatches"] = tournamentMatches
        record["groups"] = groups
        record["location"] = location
        record["address"] = address
        
    }
    
    init?(record: CKRecord){
        guard let id = record["id"] as? String,
              let name = record["name"] as? String,
              let tournamentTypeString = record["tournamentType"] as? String,
              let organizerId = record["organizerId"] as? String,
              let selectedCourt = record["selectedCourt"] as? Int,
              let nodesCreated = record["nodesCreated"] as? Int,
              let numGroups = record["numGroups"] as? Int,
              let players = record["players"] as? [String],
              let courts = record["courts"] as? [String],
              let startDate = record["startDate"] as? String,
              let endDate = record["endDate"] as? String,
              let startTime = record["startTime"] as? String,
              let endTime = record["endTime"] as? String,
              let ranking = record["ranking"] as? [String],
              let tournamentMatches = record["tournamentMatches"] as? [String],
              let groups = record["groups"] as? [String],
              let location = record["location"] as? String,
              let address = record["address"] as? String else { return nil }
        
        guard let tournamentType = TournamentTypes(rawValue: tournamentTypeString) else { return nil }
        
        self.id = id
        self.name = name
        self.tournamentType = tournamentType
        self.organizerId = organizerId
        self.selectedCourt = selectedCourt
        self.nodesCreated = nodesCreated
        self.numGroups = numGroups
        self.players = players
        self.courts = courts
        self.startDate = startDate
        self.endDate = endDate
        self.startTime = startTime
        self.endTime = endTime
        self.ranking = ranking
        self.tournamentMatches = tournamentMatches
        self.groups = groups
        self.location = location
        self.address = address
        self.record = record
    }
    
    init?(name: String, tournamentType: TournamentTypes, organizerId: String, selectedCourt: Int, nodesCreated: Int, numGroups: Int, players: [String], courts: [String], startDate: String, endDate: String, startTime: String, endTime: String, ranking: [String], tournamentMatches: [String], groups: [String], location: String, address: String){
        let record = CKRecord(recordType: "Tournament")
        
        record["id"] = UUID().uuidString
        record["name"] = name
        record["tournamentType"] = tournamentType.rawValue
        record["organizerId"] = organizerId
        record["selectedCourt"] = selectedCourt
        record["nodesCreated"] = nodesCreated
        record["numGroups"] = numGroups
        record["players"] = players
        record["courts"] = courts
        record["startDate"] = startDate
        record["endDate"] = endDate
        record["startTime"] = startTime
        record["endTime"] = endTime
        record["ranking"] = ranking
        record["tournamentMatches"] = tournamentMatches
        record["groups"] = groups
        record["location"] = location
        record["address"] = address
        
        self.init(record: record)
    }
    
    func updateRecord(){
        self.record["id"] = self.id
        self.record["name"] = self.name
        self.record["tournamentType"] = self.tournamentType.rawValue
        self.record["organizerId"] = self.organizerId
        self.record["selectedCourt"] = self.selectedCourt
        self.record["nodesCreated"] = self.nodesCreated
        self.record["numGroups"] = self.numGroups
        self.record["players"] = self.players
        self.record["courts"] = self.courts
        self.record["startDate"] = self.startDate
        self.record["endDate"] = self.endDate
        self.record["startTime"] = self.startTime
        self.record["endTime"] = self.endTime
        self.record["ranking"] = self.ranking
        self.record["tournamentMatches"] = self.tournamentMatches
        self.record["groups"] = self.groups
        self.record["location"] = self.location
        self.record["address"] = self.address
    }
    
    mutating func addPlayers(player: String){
        players.append(player)
    }
    
    mutating func addCourts(court:String){
        let vm = CloudKitCrudBootcampViewModel()
        
        courts.append(court)
        
        vm.updateTournament(tournament: self)
    }
    
    //     Retornar a court baseado no courts do tournament
    mutating func selectCourt(nodeId: String, completion: @escaping (String) -> Void){
        let vm = CloudKitCrudBootcampViewModel()
        
        if (selectedCourt == courts.count){
            selectedCourt = 0
        }
        let courtSelectedId = courts[selectedCourt]
        
        vm.fetchCourtById(id: courtSelectedId) { courtLet in
            var court = courtLet
            court.line.append(nodeId)
            completion(court.id)
            
            vm.updateCourt(court: court)
        }
    }
    
    func changeCourt(nodeId: String, courtId: String, groupId: String){
        let vm = CloudKitCrudBootcampViewModel()
        if(tournamentType == .Tree){
            for court in courts {
                if (court == courtId){
                    vm.fetchCourtById(id: court) { courtLet in
                        var court = courtLet
                        var nodeIdAux = 0
                        for i in 0...tournamentMatches.count-1{
                            if (tournamentMatches[i] == nodeId && nodeIdAux == 0){
                                nodeIdAux = i + 1
                            }
                        }
                        
                        vm.fetchNodeById(id: tournamentMatches[(nodeIdAux*2)]) { nodeLet in
                            var node = nodeLet
                            
                            vm.fetchCourtById(id: node.courtId) { courtLet2 in
                                var court = courtLet2
                                court.removeById(nodeId: tournamentMatches[nodeIdAux*2])
                                court.removeById(nodeId: tournamentMatches[(nodeIdAux*2)-1])
                            }
                            
                            node.courtId = court.id
                            vm.updateNode(node: node)
                        }
                        
                        vm.fetchNodeById(id: tournamentMatches[(nodeIdAux*2)-1]) { nodeLet in
                            var node = nodeLet
                            node.courtId = court.id
                            vm.updateNode(node: node)
                        }
                        
                        court.line.append(tournamentMatches[(nodeIdAux*2)])
                        court.line.append(tournamentMatches[(nodeIdAux*2)-1])
                        vm.updateCourt(court: court)
                    }
                }
            }
        }
        else{
            //            for court in courts {
            //                if (court == courtId){
            //                    for i in  0...groups[groupId-1].playersInGroup.count-1{
            //                        if (groups[groupId-1].playersInGroup[i].id == nodeId){
            //                            if(nodeId%2 == 1){
            ////                                groups[groupId-1].playersInGroup[i].court.removeById(nodeId: groups[groupId-1].playersInGroup[i].id)
            ////                                groups[groupId-1].playersInGroup[i+1].court.removeById(nodeId: groups[groupId-1].playersInGroup[i+1].id)
            ////                                groups[groupId-1].playersInGroup[i].court = court
            ////                                groups[groupId-1].playersInGroup[i+1].court = court
            //                                court.line.append(groups[groupId-1].playersInGroup[i])
            //                                court.line.append(groups[groupId-1].playersInGroup[i+1])
            //                            }
            //                            else{
            //                                if(nodeId%2 == 1){
            ////                                    groups[groupId-1].playersInGroup[i-1].court.removeById(nodeId: groups[groupId-1].playersInGroup[i-1].id)
            ////                                    groups[groupId-1].playersInGroup[i].court.removeById(nodeId: groups[groupId-1].playersInGroup[i].id)
            ////                                    groups[groupId-1].playersInGroup[i-1].court = court
            ////                                    groups[groupId-1].playersInGroup[i].court = court
            //                                    court.line.append(groups[groupId-1].playersInGroup[i-1])
            //                                    court.line.append(groups[groupId-1].playersInGroup[i])
            //                                }
            //                            }
            //                        }
            //                    }
            //                }
            //            }
        }
    }
    
    func checkCourtTree(nodeId: String, completion: @escaping (Int) -> Void){
        let vm = CloudKitCrudBootcampViewModel()
        
        for nodeString in tournamentMatches{
            if(nodeString == nodeId){
                //var auxCourt = ""
                vm.fetchNodeById(id: nodeString) { nodeLet in
                    let nodeFound = nodeLet
                    let auxCourt = nodeFound.courtId
                    
                    vm.fetchCourtById(id: auxCourt) { courtLet in
                        let court = courtLet
                        court.positionInLine(nodeId: nodeId) { result in
                            if result != 0 {
                                completion(result)
                            } else {
                                completion(0)
                            }
                        }
                    }
                }
            }
        }
    }
    
        func selectWinnerTree(id: String){
            let vm = CloudKitCrudBootcampViewModel()

            vm.fetchNodeById(id: id) { nodeLet in
                var node = nodeLet
                node.winner += 1
                var auxCourt = node.courtId
                vm.fetchCourtById(id: auxCourt) { court in
                    var courtAux = court
                    courtAux.removeByIndex(index: 0)
                    courtAux.removeByIndex(index: 1)
                    vm.updateCourt(court: courtAux)
                }
                vm.updateNode(node: node)
            }
            for i in 0...tournamentMatches.count{
                if tournamentMatches[i] == id{
//                    tournamentMatches[i].removeFromLine()
                    vm.updateTournament(tournament: self)
                }
            }
        }
    
        func selectWinnerGroup(groupId: String,nodeId: String){
            let vm = CloudKitCrudBootcampViewModel()
            vm.fetchTeamById(id: groupId) { teamLet in
                var team = teamLet
                
                vm.fetchNodeById(id: nodeId) { nodeLet in
                    var node = nodeLet
                    node.winner += 1
                    node.removeFromLine()
                }
                team.matches.removeFirst()
                team.matches.removeFirst()
            }
        }
    
    mutating func createOccupiedNode(num : Int) -> Node{
            nodesCreated += 1

            var courtString: String = ""
            selectCourt(nodeId: String(nodesCreated)) { str in
                courtString = str
            }

            guard let novoNodo = Node(empty: 0, finished: 0, player: players[num], time: Date.init(), courtId: courtString, winner: 0) else { return Node()}

//            Node(id: String(nodesCreated), empty: 0, player: players[num], time: Date.init(), court: self.selectCourt(nodeId: tournamentMatches.count+1), winner: 0)

            return novoNodo
        }
//
        //tournamentMatches sai dessa funcao como uma arvore com os pais vazios cujas folhas sao
        //todos os jogadores com suas respectivas quadras, ou seja, a configuracao inicial do torneio
        mutating func createTournamentTree(){
            let vm = CloudKitCrudBootcampViewModel()
            
            self.id = "10"
            var match = 0
            for i in 1...(players.count * 2)-1{
                if(i < players.count){
                    nodesCreated += 1
                    
                    guard let node = Node(empty: 1, finished: 0, player: "", time: Date.init(), courtId: "", winner: 0) else { return }
                    
                    tournamentMatches.append(node.id)
                    
                    vm.updateNode(node: node)
                    
                }
                else{
                    tournamentMatches.append(createOccupiedNode(num: i-players.count).id)
                    match += 1
                    if(match == 2){
                        selectedCourt += 1
                        match = 0
                    }
                }
            }
            vm.updateTournament(tournament: self)
        }
    
        //atualiza o torneio e move ele para a próxima etapa
        mutating func updateTournamentTree(){
            let vm = CloudKitCrudBootcampViewModel()
            
            var nodeArray: [Node] = []
            
            vm.fetchAllNodesById(ids: tournamentMatches) { nodes in
                nodeArray = nodes
            }
            
            for i in 0...nodeArray.count{
                let aux = Int(floor(Double(i/2)))
                if(nodeArray[i].winner >= 1 && nodeArray[aux].empty == 1){
                    nodeArray[i].winner = 0
                    tournamentMatches[aux] = nodeArray[i].id
                }
                if(i == 0 && nodeArray[i].empty == 0){
                    createRanking()
                }
                
            }
            vm.updateTournament(tournament: self)
        }
    
    //    //rever o default
    //    func createTournamentGroup(){
    //        self.id = 10
    //        let playersTotal = players.count
    //        switch playersTotal {
    //        case 3...5:
    //            for i in 0...playersTotal-1{
    ////                let newGroup = Team(id: numGroups, players: [createOccupiedNode(num: i)], matches: [])
    ////                groups.append(newGroup)
    //                selectedCourt += 1
    //            }
    //            break
    //        default:
    //            var offset = playersTotal%3
    //            var adjustment = 0
    //            for i in 0...Int(floor(Double(playersTotal/3))) - 1{
    //                numGroups += 1
    //                if (offset > 0){
    ////                    let newGroup = Team(id: numGroups, players: [createOccupiedNode(num: i*3+adjustment),createOccupiedNode(num: i*3+1+adjustment),createOccupiedNode(num: i*3+2+adjustment),createOccupiedNode(num: i*3+3+adjustment)], matches: [])
    ////                    groups.append(newGroup)
    ////                    newGroup.matchMaker()
    //                    selectedCourt += 1
    //                    offset -= 1
    //                    adjustment += 1
    ////                    groups.append(newGroup)
    //                }
    //                else{
    ////                    let newGroup = Team(id: numGroups, players: [createOccupiedNode(num: i*3+adjustment),createOccupiedNode(num: i*3+1+adjustment),createOccupiedNode(num: i*3+2+adjustment)], matches: [])
    ////                    groups.append(newGroup)
    ////                    newGroup.matchMaker()
    ////                    selectedCourt += 1
    ////                    groups.append(newGroup)
    //                }
    //            }
    //            break
    //        }
    //    }
    //
    //    func updateTournamentGroup(){
    //        var nextBatch: [String] = []
    //        for group in groups{
    ////            var highestWins = Node(id: 0, empty: 0, player: "", time: Date.init(), court: Court(id: 0, name: "", line: []), winner: 0)
    ////            for player in group.playersInGroup {
    ////                if(player.winner > highestWins.winner){
    ////                    highestWins = player
    ////                }
    ////            }
    ////            nextBatch.append(highestWins.player)
    //        }
    //        players = nextBatch
    //        createTournamentGroup()
    //    }
    //
        //cria um ranking com base no torneio concluido
        mutating func createRanking(){
            let vm = CloudKitCrudBootcampViewModel()
            
            var nodeArray: [Node] = []
            
            vm.fetchAllNodesById(ids: tournamentMatches) { nodes in
                nodeArray = nodes
            }
            
            for i in 0...nodeArray.count{
                if(nodeArray[i].winner >= 1){
                    if(i < 8){
                        var auxRank: Bool = true
                        for o in 0...ranking.count{
                            if (ranking[o] == nodeArray[i].id){
                                auxRank = false
                            }
                        }
                        if(auxRank == true){
                            ranking.append(nodeArray[i].id)
                        }
                    }
                }
            }
            vm.updateTournament(tournament: self)
        }
}
