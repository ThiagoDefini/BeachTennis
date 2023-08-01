//
//  Managing.swift
//  BeachTennis
//
//  Created by Madu Maciel on 28/07/23.
//

import SwiftUI

struct Managing: View {
    
    var body: some View {
        NavigationView{
            VStack{
                Image("jiji")
                    .resizable()
                    .frame(width: 350, height: 182)
                    .cornerRadius(16)
                    .navigationTitle("Managing")
                    .offset(y: -60)
                
                NavigationLink(destination: CreateChamp(), label: { Text("New championship")})
                // .cornerRadius(16)
                    .frame(width: 350, height: 64)
                    .background(Color("blue"))
                    .foregroundColor(.white)
                
                
            }
        }
    }
}

struct Managing_Previews: PreviewProvider {
    static var previews: some View {
        Managing()
    }
}
