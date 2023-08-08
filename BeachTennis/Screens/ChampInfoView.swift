//
//  ChampInfoView.swift
//  BeachTennis
//
//  Created by Madu Maciel on 04/08/23.
//

import SwiftUI

struct ChampInfoView: View, Shape {
    @State var addPlayers: Bool = false
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    var championship: Tournament = Tournament(id: 12345, name: "Sun, Sand, and Smashes", tournamentType: .Tree, organizerId: 1, players: [], courts: [], startingTime: Date.now, ranking: [], tournamentMatches: [], groups: [], location: "Parque Esportivo da PUCRS", adress: "Av. Ipiranga, 6690 - Partenon, RS, 90619-900")
    
    let link = URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!
    
    func path(in rect: CGRect) -> Path {
           let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
           return Path(path.cgPath)
       }
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color("bege")
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Image("jiji")
                        .resizable()
                        .frame(width: 440, height: 500)
                        .edgesIgnoringSafeArea(.all)
                        .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
                        .offset(y: -300)
                    CreateComponent()
                        .offset(y: -370 )
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 372, height: 142)
                            .foregroundColor(Color("bege"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color("orange"), lineWidth: 2)
                            )
                        HStack{
                            Image("checkmark")
                                .resizable()
                                .frame(width: 23, height: 26)
                            VStack{
                                Text("Parque Esportivo da PUCRS")
                                Text("Avenida Ipiranga, 6690 - Partenon 90304-000, POA, RS")
                                    .padding(.leading)
                            }
                            
                        }
                    }
                    
//                    RoundedRectangle(cornerRadius: 20)
//                        .frame(width: 372, height: 142)
//                        .foregroundColor(Color("bege"))
//                        .overlay(
//                                  RoundedRectangle(cornerRadius: 20)
//                                      .stroke(Color("orange"), lineWidth: 2)
//                              )
//                    RoundedRectangle(cornerRadius: 20)
//                        .frame(width: 372, height: 142)
//                        .foregroundColor(Color("bege"))
//                        .overlay(
//                                  RoundedRectangle(cornerRadius: 20)
//                                      .stroke(Color("orange"), lineWidth: 2)
//                              )
//
//
                    
                   
                    Button("Start championship"){
                        
                    }
                    .frame(width: 372, height: 65)
                    .foregroundColor(Color("bege"))
                    .background(Color("blue"))
                    .cornerRadius(20)
                }
            }
        }
    }
  
        
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( ChampInfoView(radius: radius, corners: corners) )
    }
}

struct ChampInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ChampInfoView()
    }
}
