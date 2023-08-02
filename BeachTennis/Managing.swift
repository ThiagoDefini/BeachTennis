//
//  Managing.swift
//  BeachTennis
//
//  Created by Madu Maciel on 28/07/23.
//

import SwiftUI

struct Managing: View {
    @State private var isCreated = false
    
    var body: some View {
        NavigationView{
            VStack{
                if isCreated == true {
                    
                }
                
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
