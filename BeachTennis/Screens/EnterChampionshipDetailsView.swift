//
//  EnterChampionshipDetailsView.swift
//  BeachTennis
//
//  Created by Thiago Defini on 03/08/23.
//

import SwiftUI

struct EnterChampionshipDetailsView: View {
    
//    var championship: Tournament = Tournament(id: 12345, name: "Sun, Sand, and Smashes", tournamentType: .Tree, organizerId: 1, players: [], courts: [], startingTime: .now, ranking: [], tournamentMatches: [], groups: [], location: "Pucrs", adress: "Rua joão alfredo 277")
    
    var championship: Tournament
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack{
                Image("BannerImage")
                    .resizable()
                    .frame(width: 350, height: 109)
                    .cornerRadius(16)
                    .padding()
                
                
                HStack{
                    Text("Manager")
                        .frame(width: 100, height: 100)
                        .padding(.leading, 16)
                    
                    Text("\(championship.organizerId)")
                        .padding(.leading, 8)
                    Spacer()
                }
                .frame(width: 345, height: 44)
                .background(Color.white)
                .cornerRadius(16)
                .foregroundColor(.black)
                
                VStack(){
                    HStack{
                        Text("Location")
                            .frame(width: 100, height: 100)
                            .padding(.leading, 16)
                        
                        Text("\(championship.location)")
                            .padding(.leading, 8)
                        Spacer()
                    }
                    .frame(width: 345, height: 44)
                    
                    Divider()
                    
                    HStack{
                        Text("Adress")
                            .frame(width: 100, height: 100)
                            .padding(.leading, 16)
                        
                        Text("\(championship.adress)")
                            .padding(.leading, 8)
                        Spacer()
                    }
                    .frame(width: 345, height: 44)
                    
                    Divider()
                    
                    HStack{
                        Text("Start date")
                            .frame(width: 100, height: 100)
                            .padding(.leading, 16)
                        
                        Text("\(championship.startingTime)")
                            .padding(.leading, 8)
                        Spacer()
                    }
                    .frame(width: 345, height: 44)
                    
                    Divider()
                    
                    HStack{
                        Text("End date")
                            .frame(width: 100, height: 100)
                            .padding(.leading, 16)
                        
                        Text("\(championship.startingTime)")
                            .padding(.leading, 8)
                        Spacer()
                    }
                    .frame(width: 345, height: 44)
                    
                }
                .frame(width: 350)
                .background(Color.white)
                .cornerRadius(16)
                .foregroundColor(.black)
                .padding(.top, 44)
                
                
                Spacer()
                
                Button{
                    
                }label: {
                    Text("Enter championship")
                        .frame(width: 350, height: 64)
                        .background(Color("blue"))
                        .cornerRadius(16)
                        .foregroundColor(.white)
                }
                
                Button{
                    dismiss()
                }label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                }
                
            }
            
            .background(Color.gray.opacity(0.1))
            
            .navigationTitle(championship.name)
        }
    }
}

struct EnterChampionshipDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EnterChampionshipDetailsView(championship: c1)
    }
}
