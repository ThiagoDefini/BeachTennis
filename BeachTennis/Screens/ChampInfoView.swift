//
//  ChampInfoView.swift
//  BeachTennis
//
//  Created by Madu Maciel on 03/08/23.
//

import SwiftUI

struct ChampInfoView: View {
    @State var link = URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!
    var body: some View {
        VStack{
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 94, height: 41)
                        .foregroundColor(Color("bege"))
                    Text("83972")
                        .bold()
                }
                Image(systemName: "square.and.arrow.up")
                    .foregroundColor(.blue)
                    
            }
            Button("add players"){
                
            }
            .frame(width: 350, height: 64)
            .background(Color("blue"))
            .foregroundColor(.white)
            .cornerRadius(16)
        }
    }
}
struct ChampInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ChampInfoView()
    }
}
