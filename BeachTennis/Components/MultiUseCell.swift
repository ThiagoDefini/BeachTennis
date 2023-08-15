//
//  MultiUseCell.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 09/08/23.
//

import SwiftUI

struct MultiUseCell: View {
    var text1 = ""
    var text2 = ""
    var image = ""
    var body: some View {
        HStack(spacing:10){
            Image(systemName: image)
                .foregroundColor(Color("orange"))
            VStack(alignment: .leading){
                Text(text1)
                    .foregroundColor(.black)
                    .font(.title2)
                Text(text2)
                    .foregroundColor(.black)
                    .font(.subheadline)
            }
            .padding(10)
            Spacer()
        }
        .padding(16)
        .frame(width: 340)
        .frame(height: 70)
        .cornerRadius(16)
        .overlay {
            RoundedCorner(radius: 16)
                .stroke(lineWidth: 2)
                .foregroundColor(Color("orange"))
        }
    }
}

struct MultiUseCell_Previews: PreviewProvider {
    static var previews: some View {
        MultiUseCell(text1: "Titulo", text2: "Subtitulo", image: "star.fill")
    }
}
