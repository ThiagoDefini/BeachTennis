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
    @State private var startDate: String = ""
    @State private var endDate: String = ""
    @State private var startTime: String = ""
    @State private var endTime: String = ""
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
                                        TextField("End date", text: self.$endDate)
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
                                        TextField("End date", text: self.$endTime)
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

                    Button(action: {
                        if name != "" && tennisCourt != "" && address != "" {
                            guard let id = vm.userId else { return print("Erro no userID")}
                            vm.addTournament(name: name, tournamentType: .Tree, organizerId: id, selectedCourt: 0, nodesCreated: 0, numGroups: 0, players: [], courts: [], startDate: startDate, endDate: endDate, startTime: startTime, endTime: endTime, ranking: [], tournamentMatches: [], groups: [], location: tennisCourt, address: address)
                            
                        } else {
                            print("Tem algum campo vazio")
                        }
                        createButton.toggle()
                        
                    }, label: {
                        Text("Next")
                            .frame(width: 350, height: 64)
                            .background(Color("blue"))
                            .foregroundColor(.white)
                            .cornerRadius(16)
                        
                    })
                    .sheet(isPresented: $createButton, content:{ Created(code: "61A86C2B-0ECF-4918-A193-286DE1F630E7")})
                }
                .navigationTitle("Create championship")
            }
        }
        .navigationBarHidden(true)
    }
    




struct CreateChamp_Previews: PreviewProvider {
    static var previews: some View {
        CreateChamp()
    }
}
