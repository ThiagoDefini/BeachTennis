//
//  InitialScreen.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 09/08/23.
//

import SwiftUI

struct InitialScreen: View {
    @State var name = "JoeShmoe"
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(spacing:10){
                VStack(alignment: .leading){
                    Text("Hi, "+name)
                        .foregroundColor(.black)
                        .font(.title)
                    Text("What we`re gonna play today?")
                        .foregroundColor(.black)
                        .font(.subheadline)
                }
                .padding(10)
                Spacer()
                Image(systemName: "star.fill")
            }
            .padding(16)
            .frame(width: 340)
            .cornerRadius(16)
            .overlay {
                RoundedCorner(radius: 16)
                    .stroke(lineWidth: 2)
            }
            Spacer()
            Text("Championships")
                .font(.title)
            Spacer()
            Text("Whats happening now?")
        }
    }
}

struct InitialScreen_Previews: PreviewProvider {
    static var previews: some View {
        InitialScreen()
    }
}
