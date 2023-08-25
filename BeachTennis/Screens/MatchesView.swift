////
////  MatchesView.swift
////  BeachTennis
////
////  Created by Madu Maciel on 10/08/23.
////
//
//import SwiftUI
//
//struct MatchesView: View {
//    // @State var currentScreen: Tournament = .all
//    
//    @State var all: Bool = true
//    @State var favorites: Bool = false
//    
//    var tournaments: Tournament
//    var player: Person
//    @State var favorite = false
//    
//    var body: some View {
//        NavigationStack {
//            ZStack{
//                Color("bege")
//                    .edgesIgnoringSafeArea(.all)
//                Rectangle()
//                    .foregroundColor(Color("light-orange"))
//                    .frame(width: 440, height: 350)
//                    .edgesIgnoringSafeArea(.all)
//                    .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
//                    .offset(y: -400)
//                
//                VStack{
//                    Color("dark-orange")
//                        .frame(width: 440, height: 350)
//                        .edgesIgnoringSafeArea(.all)
//                        .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
//                        .offset(y: -300)
//                    
//                    MatchComponent2()
//                    HStack{
//                        Button("All"){
//                            
//                        }
//                        .frame(width: 160, height: 39)
//                        .background(all ? Color("blue") : .white)
//                        .cornerRadius(16)
//                        .foregroundColor(all ? .white: Color("blue"))
//                        .padding(.leading)
//                        .font(.subheadline)
//                        
//                        Button("Favorites"){
//                            
//                        }
//                        .frame(width: 160, height: 39)
//                        .background(favorite ? Color("blue") :.white )
//                        .cornerRadius(16)
//                        .foregroundColor(favorite ? .white : Color("blue"))
//                        .padding(.trailing)
//                        .font(.subheadline)
//                    }
//                    Spacer()
//                    VStack{
//                        ForEach(tournaments.tournamentMatches, id: \.self) { match in
//                            if (favorite == false){
////                                MatchCard(tournament: tournaments,favorite: match.id)
//                            }
//                            if(favorite == true){
//                                //for j in player.favorites{
//                                ForEach(player.playersFavorited, id: \.self){
//                                    j in
//                                    if(j.id == match.id){
//                                        MatchCard(tournament: tournaments, favorite: 0, tournamentMatches: [])
//                                    }
//                                }
//                            }
//                        }
//                        
//                    }
//                }
//                .padding(120)
//            }
//            
//        }
//    }
//}
//



import SwiftUI

struct MatchesView: View {
    //  @State var currentScreen: Tournament = .all
    @State var favorites: Bool = false
    @EnvironmentObject var vm: CloudKitCrudBootcampViewModel
    //    var tournaments = Tournament(name: "Torneio dos Guri", tournamentType: .Tree, organizerId: "2", selectedCourt: 0, nodesCreated: 0, numGroups: 0, players: [], courts: [], startDate: "17/02", endDate: "18/02", startTime: "13:00", endTime: "17:00", ranking: [], tournamentMatches: ["Ablublu"], groups: [], location: "Centro Histórico", address: "Borges de Medeiros 123")
    
    
    @State var all = true
    @State var favorite = true
    var player = Person(id: "0", name: "", contact: "", tournamentsRegistered: ["Ablublu"])
    @State var aux:[(String,String)] = []
    
    var tournament: Tournament
    
    func returnsStrings(nodes:[String]) -> [(String,String)] {
        
        print(nodes, "nodes")
        var tuple:(String,String) = ("","")
        var counter = 0
        var tuples:[(String,String)] = []
        for node in nodes {
            print(counter, "Aca")
            
            if (counter == 0){
                tuple.0 = node
                counter += 1
                print(counter, "Aqui")
            }
            else if(counter == 1){
                tuple.1 = node
                counter = 0
                print("Cheguei aqui")
                tuples.append(tuple)
                print(tuples,"Tupla")
            }
            print("to no loop")
        }
        print(tuples,"O que ta saindo")
        return tuples
    }
    
    /* function -> []
     matrix: [(String,String)]
     [
     for {
     ("", ""),
     
     ]
     return matix
     
     
     ForeEach(matrix) { match in
     matchCard(,...., matc)
     }
     }
     */
    
    var body: some View {
        ZStack{
            Color("bege")
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color("light-orange"))
                .frame(width: 440, height: 350)
                .edgesIgnoringSafeArea(.all)
                .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
                .offset(y: -400)
            
            VStack {
                MatchComponent2(tournament: tournament)
                
                VStack {
                    //                        if tournament.players.isEmpty{
                    //                            ForEach(matches, id: \.0) { node in
                    ForEach(returnsStrings(nodes: tournament.players), id: \.0) { node in
                        NavigationLink {
                            PointsCard(tournament: tournament, players: [node.0,node.1] )
                        } label: {
                            MatchCard(tournament: tournament, favorite: 0, names:[node.0,node.1])
                        }   
                    }
                    //                        } else {
                    //                            Text("Empty")
                    //                        }
                }
                
                Spacer()
            }
            .padding(120)
        }
        .onAppear{
            vm.findNodes(array: self.tournament.tournamentMatches)
        }
    }
}
//
//struct MatchesView_Previews: PreviewProvider {
//    static var previews: some View {
//        MatchesView(tournament: c1!)
//    }
//}
