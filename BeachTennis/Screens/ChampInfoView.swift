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

struct ChampInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ChampInfoView()
    }
}
