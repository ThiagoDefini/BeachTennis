//
//  JoinCard.swift
//  BeachTennis
//
//  Created by Madu Maciel on 14/08/23.
//

import SwiftUI

struct JoinCard: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 165, height: 100)
                .foregroundColor(Color("blue"))
            VStack{
                Image(systemName: "figure.tennis")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                Text("Join")
                    .foregroundColor(.white)
                    .bold()
                
            }
        }
    }
}
struct CreateCard: View{
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 165, height: 100)
                .foregroundColor(Color("blue"))
            VStack{
                Image(systemName: "tennis.racket")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                Text("Create")
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

struct JoinCard_Previews: PreviewProvider {
    static var previews: some View {
        JoinCard()
    }
}
