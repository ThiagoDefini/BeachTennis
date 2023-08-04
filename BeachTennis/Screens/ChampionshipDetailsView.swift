//
//  ChampionshipDetailsView.swift
//  BeachTennis
//
//  Created by Thiago Defini on 03/08/23.
//

import SwiftUI

//struct BarItem: View {
//    var body: some View {
//        Image(systemName: "star")
//    }
//}

struct ChampionshipDetailsView: View {
    
    var championship: Tournament = Tournament(id: 12345, name: "Sun, Sand, and Smashes", tournamentType: .Tree, organizerId: 1, players: [], courts: [], startingTime: .now, ranking: [], tournamentMatches: [], groups: [], location: "Pucrs", adress: "Rua joão alfredo 277")
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                ZStack{
                    Image("BannerImage")
                        .resizable()
                        .frame(width: 350, height: 109)
                        .cornerRadius(16)
                        .padding()
                    
                    Text("\(championship.id)")
                        .frame(width: 97, height: 41)
                        .background(Color.yellow)
                        .cornerRadius(14)
                        .foregroundColor(.black)
                        .padding(.leading, 248)
                        .padding(.top, 63)
                    
                }
                .frame(width: 350, height: 109)
                
                HStack{
                    Image(systemName: "person")
                    
                    Text("\(championship.organizerId)")
                    
                    Spacer()
                }
                .frame(width: 350)
                .padding(.top, 24)
                
                HStack{
                    Image(systemName: "mappin")
                    
                    Text(championship.location)
                    Spacer()
                }
                .frame(width: 350)
                .padding(.top, 46)
                
                HStack{
                    Text(championship.adress)
                    Spacer()
                }
                .frame(width: 350)
                .padding(.top, 8)
                
                HStack{
                    VStack{
                        Image(systemName: "clock")
                        Spacer()
                    }
                    VStack{
                        Text("\(championship.startingTime)")
                        
                        Text("\(championship.startingTime)")
                    }
                }
                .frame(width: 350, height: 60)
                .padding(.top, 8)
             
                Text("What's happening now?")
                    .font(.title2)
                    .padding(.top, 43)
                
//                ScrollView(.horizontal){
//                    Text("äasudindasasdnjasndoasnuduoansdouasndoiandliasndliasndliansdlansdilnasildnalindliasndliasndliansdliansdilansdliansldiadnsdond")
//                }
                
                Spacer()
            }
            .foregroundColor(.black)
            .navigationTitle(championship.name)
        }
    }
}

struct ChampionshipDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ChampionshipDetailsView()
    }
}
