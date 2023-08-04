//
//  ChampComponent.swift
//  BeachTennis
//
//  Created by Madu Maciel on 03/08/23.
//

import SwiftUI

struct ChampComponent: View {
   // @Binding static var 
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 370, height: 182)
        }
    }
}

struct ChampComponent_Previews: PreviewProvider {
    static var previews: some View {
        ChampComponent()
    }
}
