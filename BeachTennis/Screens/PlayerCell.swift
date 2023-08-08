//
//  PlayerCell.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 07/08/23.
//

import SwiftUI

struct PlayerCell: View {
    var team: Node
    @State private var name: String = ""
    @State private var name2: String = ""
    
    var body: some View {
        VStack{
            Text("Team")
                .padding(.leading,-170)
            HStack(spacing: 20){
                Text("Name 1")
                    .foregroundColor(.black)
                TextField("name", text: self.$name)
                    .foregroundColor(.black)
            }
            .padding(.leading, 40)
            Divider()
            HStack(spacing: 20){
                Text("Name 2")
                    .foregroundColor(.black)
                TextField("name", text: self.$name2)
                    .foregroundColor(.black)
            }
            .padding(.leading, 40)
            Divider()
        }
    }
}

struct PlayerCell_Previews: PreviewProvider {
    static var previews: some View {
        PlayerCell(team: c1.tournamentMatches[1])
    }
}
