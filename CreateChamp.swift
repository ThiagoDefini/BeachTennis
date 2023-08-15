//
//  CreateChamp.swift
//  BeachTennis
//
//  Created by Madu Maciel on 28/07/23.
//

import SwiftUI

struct CreateChamp: View {
    @State private var name: String = ""
    @State private var tennisCourt: String = ""
    @State private var address: String = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var image = Image("")
    
    let vm = CloudKitCrudBootcampViewModel()
    
    
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
                                        DatePicker("", selection: $startDate, displayedComponents: .date)
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
                                        DatePicker("", selection: $endDate, displayedComponents: .date)
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
                                        DatePicker("", selection: $startDate, displayedComponents: .hourAndMinute)
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
                                        DatePicker("", selection: $endDate, displayedComponents: .hourAndMinute)
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

                    Button("Create championship"){
                        if name != "" && tennisCourt != "" && address != "" {
                            vm.addTournament(name: name, tournamentType: .Tree, organizerId: "adsasd", selectedCourt: 0, nodesCreated: 0, numGroups: 0, players: [], courts: [], startingTime: startDate, endingTime: endDate, ranking: [], tournamentMatches: [], groups: [], location: tennisCourt, address: address)
                            
                        } else {
                            print("Tem algum campo vazio")
                        }
                        
                        createButton.toggle()
                    }
                    .sheet(isPresented: $createButton) {
                        Created(code: "61A86C2B-0ECF-4918-A193-286DE1F630E7")
                        
                    }
                    .frame(width: 350, height: 64)
                    .background(Color("orange"))
                    .cornerRadius(16)
                    .foregroundColor(.white)
                    .padding()
                    
                }
                .navigationTitle("Create championship")
            }
        }
    }
    




struct CreateChamp_Previews: PreviewProvider {
    static var previews: some View {
        CreateChamp()
    }
}
