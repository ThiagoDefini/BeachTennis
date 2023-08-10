//
//  MultiUseCell.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 09/08/23.
//

import SwiftUI

struct MultiUseCell: View {
    var body: some View {
        HStack(spacing:10){
            Image(systemName: "star.fill")
            VStack(alignment: .leading){
                Text("Titulo")
                    .foregroundColor(.black)
                    .font(.title)
                Text("Descricao")
                    .foregroundColor(.black)
                    .font(.subheadline)
            }
            .padding(10)
            Spacer()
        }
        .padding(16)
        .frame(width: 340)
        .cornerRadius(16)
        .overlay {
            RoundedCorner(radius: 16)
                .stroke(lineWidth: 2)
        }
    }
}

struct MultiUseCell_Previews: PreviewProvider {
    static var previews: some View {
        MultiUseCell()
    }
}
