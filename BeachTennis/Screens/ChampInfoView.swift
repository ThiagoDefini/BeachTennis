//
//  ChampInfoView.swift
//  BeachTennis
//
//  Created by Madu Maciel on 04/08/23.
//

import SwiftUI

struct ChampInfoView: View {
    @State var addPlayers: Bool = false
    
    var championship: Tournament = Tournament(id: 12345, name: "Sun, Sand, and Smashes", tournamentType: .Tree, organizerId: 1, players: [], courts: [], startingTime: Date.now, ranking: [], tournamentMatches: [], groups: [], location: "Parque Esportivo da PUCRS", adress: "Av. Ipiranga, 6690 - Partenon, RS, 90619-900")
    
    let link = URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                    Image("BannerImage")
                        .resizable()
                        .frame(width: 350, height: 109)
                        .cornerRadius(16)
                        .padding()
            
                HStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 94,height: 41)
                            .foregroundColor(Color("bege"))
                        Text("83972")
                            .foregroundColor(Color("gray"))
                            .bold()
                    }
                    
                    ShareLink(item: link)
                        .foregroundColor(Color("orange"))
                    
                }
                .frame(width: 350)
                .padding(.top, 24)
                
                HStack{
                    Image(systemName: "mappin")
                        .foregroundColor(Color("yellow"))
                        .padding(.leading, 7)
                    
                    Text(championship.location)
                        .foregroundColor(.black)
                    Spacer()
                }
                .frame(width: 350)
                .padding(.top, 46)
                
                HStack{
                    Text(championship.adress)
                        .foregroundColor(.gray)
//                    Spacer()
                }
                .frame(width: 350)
                .padding(.top, 8)
                
                HStack{
                    VStack{
                        Image(systemName: "clock")
                            .foregroundColor(Color("yellow"))
                        Spacer()
                    }
                    VStack{
                        Text("\(championship.startingTime)")
                            .foregroundColor(.black)
                        
                        Text("\(championship.startingTime)")
                            .foregroundColor(.black)
                    }
                }
                .frame(width: 350, height: 60)
                .padding(.top, 8)
                Spacer()
                Button("Add players"){
                addPlayers.toggle()
            }
                .frame(width: 350, height: 64)
                .foregroundColor(.white)
                .background(Color("orange"))
                .cornerRadius(16)
                .padding(.leading)
                
                
                
            
            }
          
            .navigationTitle(championship.name)
            
        }
    }
}

struct ChampInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ChampInfoView()
    }
}
