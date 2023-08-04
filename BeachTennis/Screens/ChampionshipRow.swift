//
//  ChampionshipRow.swift
//  BeachTennis
//
//  Created by Thiago Defini on 03/08/23.
//

import SwiftUI

struct ChampionshipRow: View {
    var champ: Tournament
    
    var body: some View {
        ZStack(alignment: .leading){
            Image("BannerImage")
            VStack{
                Text(champ.name)
                
                Text(champ.location)
                
                Text("\(champ.startingTime.formatted())")
            }
            .foregroundColor(.white)
            .padding(.leading)
        }
    }
}

struct ChampionshipRow_Previews: PreviewProvider {
    static var previews: some View {
        ChampionshipRow(champ: c1)
    }
}
