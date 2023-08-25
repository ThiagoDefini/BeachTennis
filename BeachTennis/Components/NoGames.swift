//
//  NoGames.swift
//  BeachTennis
//
//  Created by Madu Maciel on 15/08/23.
//

import SwiftUI

struct NoGames: View {
    var body: some View {
        ZStack{
            Color("bege")
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image(systemName: "trophy.fill")
                    .font(.system(size: 40))
                    .padding()
                    .foregroundColor(Color("orange"))
                Text("You still haven't enrolled in any tournaments.")
                    .foregroundColor(Color("orange"))
                Text(" Join a championship to be showcased here!")
                    .foregroundColor(Color("orange"))
            }
            .padding()
           
        }
        .frame(width: 420,height: 80)
       
    }
}

struct NoNow: View {
    var body: some View {
        ZStack{
            Color("bege")
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center){
                Image(systemName: "tennisball.fill")
                    .font(.system(size: 40))
                    .padding()
                    .foregroundColor(Color("orange"))
                Text("There are no ongoing games at the moment.")
                    .foregroundColor(Color("orange"))
                Text("Stay tuned for upcoming matches  that will be")
                    .foregroundColor(Color("orange"))
                Text("showcased here!")
                    .foregroundColor(Color("orange"))
    
            }
            .padding()
           
        }
        .frame(width: 420,height: 80)
       
    }
    
}

struct NoGames_Previews: PreviewProvider {
    static var previews: some View {
        NoGames()
    }
}
