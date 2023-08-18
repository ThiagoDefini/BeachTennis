//
//  MatchCell.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 15/08/23.
//

import SwiftUI

struct MatchCell: View {
//    var tournamentMatches: [Node]
    var names: [String]

//    @State var favorite: Int
    
    var body: some View {
        VStack(spacing: 20){
            Spacer()
            HStack{
                Text("Match #12")
                    .bold()
                    .foregroundColor(.brown)
                Spacer()
                Image(systemName: "clock.fill")
                    .foregroundColor(Color("orange"))
                Text("17:00")
                    .foregroundColor(.black)
                    .font(.subheadline)
            }
            .padding(.top)
            .padding(.horizontal)
            
            HStack{
                VStack(spacing: 5){
                    Text(names[0].split(separator: "&")[0])
                        .foregroundColor(.black)
                    Text(names[0].split(separator: "&")[1])
                        .foregroundColor(.black)
                    
                }
                Spacer()
                Text("X")
                    .foregroundColor(Color("orange"))
                    .bold()
                Spacer()
                VStack(spacing: 5){
                    Text(names[1].split(separator: "&")[0])
                        .foregroundColor(.black)
                    Text(names[1].split(separator: "&")[1])
                        .foregroundColor(.black)
                }
            }
            HStack{
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: "calendar.badge.clock")
                            .foregroundColor(Color("orange"))
                        Text("12/04/2023 - 17:00 PM")
                            .foregroundColor(.black)
                    }
                    HStack{
                        Image("mapa")
                            .resizable()
                            .frame(width: 18, height: 20)

                        Text("Quadra 3")
                            .foregroundColor(.black)

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
                    .stroke(Color("orange"))
            }
        }
        .padding(16)
        .frame(width: 350)
        .frame(height: 207)
        .cornerRadius(16)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color("orange"), lineWidth: 1)
        }
    }
}

struct MatchCell_Previews: PreviewProvider {
    static var previews: some View {
        MatchCell( names: ["P & u","P & u"])
    }
}
