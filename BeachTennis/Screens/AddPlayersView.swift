//
//  AddPlayersView.swift
//  BeachTennis
//
//  Created by Madu Maciel on 04/08/23.
//

import SwiftUI

struct AddPlayersView: View {
    @State private var name: String = ""
    
    var body: some View {
        NavigationView{
            VStack{
                Group{
                    HStack(spacing: 20){
                        Text("Name 1")
                            .foregroundColor(.black)
                        TextField("name", text: self.$name)
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 40)
                    Divider()
                }
            }.navigationTitle("Add Players")
        }
    }
}

struct AddPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayersView()
    }
}
