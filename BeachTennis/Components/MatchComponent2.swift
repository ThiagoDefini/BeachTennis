//
//  MatchComponent2.swift
//  BeachTennis
//
//  Created by Madu Maciel on 10/08/23.
//

import SwiftUI

struct MatchComponent2: View {
    var body: some View {
        ZStack{
            RoundedCorner(radius: 20)
                .stroke(lineWidth: 0.5)
                .foregroundColor(Color("orange"))
                .frame(width: 372, height: 104)
                .background(.white)
            
                VStack{
                    Text("Matches")
                        .foregroundColor(Color("gray"))
                        .font(.system(size: 24))
                        .bold()
                        .padding(.trailing, 235)
                        .padding(.bottom, 5)
                        
                  
                       
                    
                    
                 
                  
                    Text("Torneio das gurias")
                        .padding(.trailing, 180)
                        .font(.system(size: 18))
                        .foregroundColor(Color("orange"))
                        .bold()
                       
                    
                    
       }
            
    }
    }
}

struct MatchComponent2_Previews: PreviewProvider {
    static var previews: some View {
        MatchComponent2()
    }
}
