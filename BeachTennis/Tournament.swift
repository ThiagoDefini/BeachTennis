//
//  Tournament.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 24/07/23.
//

import Foundation

class Tournament{
    var id: Int
    var SelectedCourt:Int = 0
    var tournamentMatches: [Node]
    var players: [String]
    var courts: [Court]
    var startingTime: Date
    var ranking: [String]
    
    init(id: Int, players: [String], courts: [Court], startingTime: Date, ranking: [String], tournamentMatches: [Node]){
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
    
    func selectWinner(id: Int){
        tournamentMatches[id].winner = true
    }
    
    func createTournament(){
        self.id = 10
        for i in 1...((players.count * 2)-1){
            if(i < players.count){
                tournamentMatches.append(Node(empty: true, player: "", time: Date.init(), court: Court.init(id: 0, name: ""), winner: false))
            }
            else{
                tournamentMatches.append(Node(empty: false, player: players[i-players.count], time: Date.init(), court: self.selectCourt(), winner: false))
            }
        }
    }
}
