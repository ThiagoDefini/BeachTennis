//
//  MatchCard.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 08/08/23.
//

import SwiftUI

struct MatchCard: View {
    var tournament: Tournament
    var team: Int
    @State var favorite: Int
    @State var names: [String]
    
    var body: some View {
        VStack(spacing: 20){
            HStack{
                Text("Match #12")
                    .foregroundColor(Color("orange"))
                    .font(.custom("Nunito-VariableFont_wght", size: 20))
                    .bold()
                    .padding(.top)
                Spacer()
                ZStack{
                    Button {
                        if(favorite == 1){
                            favorite = 0
                        }else{favorite = 1}
                    } label: {
                        Image(systemName: favorite == 1 ? "heart.fill" : "heart")
                    }
                }
              
            }
            .padding(.top)
           
            HStack {
                if(team == 1){
                    VStack(alignment: .leading,spacing: 5){
                        Text(names[0].split(separator: "&")[0])
                            .foregroundColor(.black)
                            .font(.custom("Nunito", size: 20))
                        Text(names[0].split(separator: "&")[1])
                            .foregroundColor(.black)
                            .font(.custom("Nunito", size: 20))
                        
                    }
                }
                else{
                    VStack(spacing: 5){
                        Text(names[0])
                    }
                }
                Spacer()
                Text("X")
                    .foregroundColor(Color("orange"))
                    .font(.custom("Nunito", size: 20))
                    .bold()
                Spacer()
                if(team == 1){
                    VStack(alignment: .leading,spacing: 5){
                        Text(names[1].split(separator: "&")[0])
                            .foregroundColor(.black)
                            .font(.custom("Nunito", size: 20))
                        Text(names[1].split(separator: "&")[1])
                            .foregroundColor(.black)
                            .font(.custom("Nunito", size: 20))
                    }
                }
                else{
                    VStack(spacing: 5){
                        Text(names[1])
                    }
                }
            }
            HStack{
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: "calendar.badge.clock")
                            .foregroundColor(Color("orange"))
                        Text("12/04/2023 - 17:00 PM")
                            .foregroundColor(.black)
                            .font(.custom("Nunito", size: 20))
                    }
                    HStack{
                        Image("mapa")
                            .resizable()
                            .frame(width: 18, height: 20)
                        
                        Text("Quadra 3")
                            .foregroundColor(.black)
                            .font(.custom("Nunito", size: 20))

                    }
                }
                .padding()
                Spacer()
            }
            .background(Color("dark-bege"))
            .frame(width: 350)
            .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
            .overlay {
                RoundedCorner(radius: 16, corners: [.bottomLeft, .bottomRight])
                    .stroke(lineWidth: 1)
            }
        }
        .padding(16)
        .frame(width: 350)
        .frame(height: team == 1 ? 207 : 180)
        .cornerRadius(16)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color("orange"), lineWidth: 1)
        }
    }
}

struct MatchCard_Previews: PreviewProvider {
    static var previews: some View {
        MatchCard(tournament:c2,team:1,favorite:0, names: ["Pepper&Steak","Sofia&Horacio"])
    }
}
