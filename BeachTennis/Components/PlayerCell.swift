//
//  PlayerCell.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 07/08/23.
//

import SwiftUI

struct PlayerCell: View {
    var team: Node
    var number: Int
    @State private var name: String = ""
    @State private var name2: String = ""
    
    var body: some View {
        VStack{
            Text("Team #"+String(number))
                .padding(.leading,0)
            HStack(spacing: 5){
                Text("Team Name:")
                    .foregroundColor(.black)
                Text(team.player)
                    .foregroundColor(.black)
            }
            .padding(.leading, 0)
            Divider()
        }
    }
}

struct PlayerCell_Previews: PreviewProvider {
    static var previews: some View {
        PlayerCell(team: c2.tournamentMatches[0],number:0)
    }
}
