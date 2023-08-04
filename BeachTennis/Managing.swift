//
//  Managing.swift
//  BeachTennis
//
//  Created by Madu Maciel on 28/07/23.
//

import SwiftUI

struct Managing: View {
    @State private var isCreated = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
            VStack{
                
                
                Button("New championship"){
                    isCreated.toggle()
                }
                .frame(width: 350, height: 64)
                .background(Color("blue"))
                .foregroundColor(.white)
                .cornerRadius(16)
                .sheet(isPresented: $isCreated, content:{ CreateChamp()})
                
                
            }
        }
    }
}

struct Managing_Previews: PreviewProvider {
    static var previews: some View {
        Managing()
    }
}
