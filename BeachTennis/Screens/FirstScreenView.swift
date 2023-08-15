//
//  FirstScreenView.swift
//  BeachTennis
//
//  Created by Madu Maciel on 14/08/23.
//

import SwiftUI

struct FirstScreenView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                VStack(alignment: .leading){
                    Text("Hi,")
                        .font(.system(size: 28))
                    Text("What we're gonna play today?")
                        .font(.system(size: 16))
                }
                PhotoPicker2()
            }
            Text("Championships")
            HStack{
                Text("My championships")
//                Button(action: <#T##() -> Void#>, label: {
//                    Text("See all")
//                })
            }
            Text("What's happening now?")
            
        }
    }
}

struct FirstScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreenView()
    }
}
