//
//  CourtCell.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 08/08/23.
//

import SwiftUI

struct CourtCell: View {
    var court: Court
    var number: Int
    @State private var name: String = ""
    @State private var name2: String = ""
    
    var body: some View {
        VStack{
            Text("Court #"+String(number))
                .padding(.leading,0)
            HStack(spacing: 5){
                Text("Court Name:")
                    .foregroundColor(.black)
                Text(court.name)
                    .foregroundColor(.black)
            }
            .padding(.leading, 0)
            Divider()
        }
    }
}

struct CourtCell_Previews: PreviewProvider {
    static var previews: some View {
        CourtCell(court: c2.courts[0],number:0)
    }
}
