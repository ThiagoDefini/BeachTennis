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
    var vm = CloudKitCrudBootcampViewModel()
    var tournaments = Tournament(name: "Torneio dos Guri", tournamentType: .Tree, organizerId: "2", selectedCourt: 0, nodesCreated: 0, numGroups: 0, players: [], courts: [], startDate: "17/02", endDate: "18/02", startTime: "13:00", endTime: "17:00", ranking: [], tournamentMatches: ["Ablublu"], groups: [], location: "Centro Histórico", address: "Borges de Medeiros 123")
    @State var all = true
    @State var favorite = true
    var player = Person(id: "0", name: "", contact: "", tournamentsRegistered: ["Ablublu"])
    @State var counter = 0
    @State var aux:[(String,String)] = []
    @State var tuple:(String,String) = ("","")
    //    func getP() {
    //        return "P"
    //    }
    //
    //    var p: String {
    //        "P"
    //    }
    
    func returnsStrings(nodes:[Node]) -> [(String,String)] {
        print(nodes)
        var tuples:[(String,String)] = [("A & B","A & B")]
        for node in nodes {
            if (node.empty == 0){
                if (counter == 0){
                    tuple.0 = node.player
                }
                if(counter == 1){
                    tuple.1 = node.player
                    counter = 0
                    tuples.append(tuple)
                }
            }
//            if(node.empty == 0) {
//                aux.append(node.player)
//                counter += 1
//                if(counter == 2) {
//                    counter = 0
//                    return 1
//                }
        }
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
    
    init() {
        if let tour = tournaments {
            vm.findNodes(array: tour.tournamentMatches)
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color("bege")
                    .edgesIgnoringSafeArea(.all)
                Rectangle()
                    .foregroundColor(Color("light-orange"))
                    .frame(width: 440, height: 350)
                    .edgesIgnoringSafeArea(.all)
                    .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
                    .offset(y: -400)
                
                VStack{
                    Color("dark-orange")
                        .frame(width: 440, height: 350)
                        .edgesIgnoringSafeArea(.all)
                        .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
                        .offset(y: -300)

                    MatchComponent2()
                    HStack{
                        Button("All"){
                            
                        }
                        .frame(width: 160, height: 39)
                        .background(all ? Color("blue") : .white)
                        .cornerRadius(16)
                        .foregroundColor(all ? .white: Color("blue"))
                        .padding(.leading)
                        .font(.subheadline)
                        
                        Button("Favorites"){
                            
                        }
                        .frame(width: 160, height: 39)
                        .background(favorite ? Color("blue") :.white )
                        .cornerRadius(16)
                        .foregroundColor(favorite ? .white : Color("blue"))
                        .padding(.trailing)
                        .font(.subheadline)
                    }
                    Spacer()
                    VStack {
                        if let nodess = vm.nodesById {
                            ForEach(returnsStrings(nodes: nodess), id: \.0) { node in
                                MatchCard(tournament: tournaments!, favorite: 0, names:[node.0,node.1])
                            }
                        } else {
                            Text("nao")
                        }
                    }

                }
                .padding(120)
            }
        }
    }
}

struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesView()
    }
}
