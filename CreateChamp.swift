//
//  CreateChamp.swift
//  BeachTennis
//
//  Created by Madu Maciel on 28/07/23.
//

import SwiftUI

class ChampFlow: ObservableObject, Equatable {
    static func == (lhs: ChampFlow, rhs: ChampFlow) -> Bool {
        lhs.finished == rhs.finished
    }
    
    @Published var finished: Bool = false
}

struct CreateChamp: View {
    @State private var name: String = ""
    @State private var tennisCourt: String = ""
    @State private var address: String = ""
    @State private var startDate: String = ""
    @State private var endDate: String = ""
    @State private var startTime: String = ""
    @State private var endTime: String = ""
    @State private var image = Image("")
    @State private var champ : Tournament?
    
    @Environment(\.dismiss) var dismiss
    @StateObject var champFlow = ChampFlow()
    
    
    @EnvironmentObject var vm: CloudKitCrudBootcampViewModel
    
    
    @State private var createButton = false
    
    let characterLimit = 18
    var body: some View {
        NavigationView{
            VStack{
                Group{
                    VStack{
                        Text("Name:")
                            .padding(.trailing, 290)
                            .foregroundColor(.black)
                        ZStack{
                            RoundedCorner(radius: 12)
                                .stroke(lineWidth: 0.5)
                                .foregroundColor(Color("blue"))
                                .frame(width: 400, height: 43)
                            HStack{
                                Image(systemName: "trophy.fill")
                                    .foregroundColor(Color("orange"))
                                TextField("Name", text: self.$name)
                                    .foregroundColor(.black)
                            }
                            .padding(.leading, 50)
                        }
                    }
                   
                    VStack{
                        Text("Location:")
                            .padding(.trailing, 270)
                            .foregroundColor(.black)
                        ZStack{
                            RoundedCorner(radius: 12)
                                .stroke(lineWidth: 0.5)
                                .foregroundColor(Color("blue"))
                                .frame(width: 400, height: 43)
                            HStack{
                                Image(systemName: "mappin")
                                    .foregroundColor(Color("orange"))
                                TextField("Location", text: self.$tennisCourt)
                                    .foregroundColor(.black)
                            }
                            .padding(.leading, 50)
                        }
                    }
                    VStack{
                        Text("Address:")
                            .padding(.trailing, 285)
                            .foregroundColor(.black)
                        ZStack{
                            RoundedCorner(radius: 12)
                                .stroke(lineWidth: 0.5)
                                .foregroundColor(Color("blue"))
                                .frame(width: 400, height: 43)
                            HStack{
                                Image(systemName: "mappin")
                                    .foregroundColor(Color("orange"))
                                TextField("Address", text: self.$address)
                                    .foregroundColor(.black)
                            }
                            .padding(.leading, 50)
                        }
                    }
                    VStack{
                        Text("Date:")
                            .padding(.trailing, 300)
                            .foregroundColor(.black)
                        HStack{
                            ZStack{
                                VStack{
                                    HStack{
                                        Image(systemName: "calendar")
                                            .foregroundColor(Color("orange"))
                                            .padding(.leading, 25)
                                        TextField("Start date", text: self.$startDate)
                                            .foregroundColor(.black)
                                    }
                                }
                                .padding(.trailing,15)
                                RoundedCorner(radius: 12)
                                    .stroke(lineWidth: 0.5)
                                    .foregroundColor(Color("blue"))
                                    .frame(width: 170, height: 43)
                                
                            }
                            
                           
                            Image(systemName: "arrow.right")
                            ZStack{
                                VStack{
                                    HStack{
                                        Image(systemName: "calendar")
                                            .foregroundColor(Color("orange"))
                                            .padding(.leading, 25)
                                        TextField("Start time", text: self.$endDate)
                                    }
                                }
                                .padding(.trailing, 15)
                                RoundedCorner(radius: 12)
                                    .stroke(lineWidth: 0.5)
                                    .foregroundColor(Color("blue"))
                                    .frame(width: 170, height: 43)
                            }
                        }
                    }
                }
                VStack{
                    Text("Hour:")
                        .padding(.trailing, 300)
                        .foregroundColor(.black)
                    HStack{
                        ZStack{
                            VStack{
                                HStack{
                                    Image(systemName: "calendar")
                                        .foregroundColor(Color("orange"))
                                        .padding(.leading, 25)
                                    TextField("End date", text: self.$startTime)
                                }
                            }
                            .padding(.trailing, 35)
                            RoundedCorner(radius: 12)
                                .stroke(lineWidth: 0.5)
                                .foregroundColor(Color("blue"))
                                .frame(width: 170, height: 43)
                            
                        }
                        Image(systemName: "arrow.right")
                        ZStack{
                            
                            VStack{
                                HStack{
                                    Image(systemName: "calendar")
                                        .foregroundColor(Color("orange"))
                                        .padding(.leading, 25)
                                    TextField("End time", text: self.$endTime)
                                }
                            }
                            .padding(.trailing, 35)
                            RoundedCorner(radius: 12)
                                .stroke(lineWidth: 0.5)
                                .foregroundColor(Color("blue"))
                                .frame(width: 170, height: 43)
                        }
                    }
                    
                }
                
             
                Spacer()
                
                if name != "" && tennisCourt != "" && address != "" && startDate != "" && startTime != "" && endDate != "" && endTime != ""{
                    
                    Button(action: {
                        guard let id = vm.userId else { return print("Erro no userID")}
                        champ = Tournament(name: name, tournamentType: .Tree, organizerId: id, selectedCourt: 0, nodesCreated: 0, numGroups: 0, players: [], courts: [], startDate: startDate, endDate: endDate, startTime: startTime, endTime: endTime, ranking: [], tournamentMatches: [], groups: [], location: tennisCourt, address: address)
                        
                        vm.addTournament(newTournament: champ ?? Tournament())
                        
                        createButton.toggle()
                        
                    }, label: {
                        Text("Next")
                            .frame(width: 350, height: 64)
                            .background(Color("blue"))
                            .foregroundColor(.white)
                            .cornerRadius(16)
                        
                    })
                    
                    NavigationLink(isActive: $createButton) {
                        AddPlayersView(tournament: champ ?? Tournament())
                            .environmentObject(champFlow)
                            .environmentObject(vm)
                            .onAppear{
                                vm.updateData()
                            }
                    } label: {
                        EmptyView()
                    }
                    
                    
                }else{
                    Button(action: {
                        // createButton.toggle()
                        
                    }, label: {
                        Text("Next")
                            .frame(width: 350, height: 64)
                            .background(Color("blue"))
                            .foregroundColor(.white)
                            .cornerRadius(16)
                        
                    })
                }
            }
            .navigationTitle("Create championship")
            
        }
        .navigationBarHidden(true)
        .onChange(of: champFlow.finished, perform: { champFlow in
            if champFlow {
                dismiss()
            }
        })
    }
    
    
}
struct CreateChamp_Previews: PreviewProvider {
    static var previews: some View {
        CreateChamp()
    }
}
