//
//  AddPlayersView.swift
//  BeachTennis
//
//  Created by Madu Maciel on 04/08/23.
//

import SwiftUI

struct AddPlayersView: View {
    
    @State private var name: String = ""
    @State private var name2: String = ""
    @State private var createButton = false
    @State private var num:Int = 1
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                HStack(spacing: 20){
                    Text("Court Name")
                        .foregroundColor(.black)
                    TextField("name", text: self.$name)
                        .foregroundColor(.black)
                }
                .padding(.leading, 40)
                Divider()
                HStack(spacing: 20){
                    Text("Description")
                        .foregroundColor(.black)
                    TextField("name", text: self.$name2)
                        .foregroundColor(.black)
                }
                .padding(.leading, 40)
                Divider()
                
                
                Spacer()
                
                Button("Add Court"){
                    createButton.toggle()
                }
                .sheet(isPresented: $createButton) {
                    Created()
                    
                }
                .frame(width: 350, height: 64)
                .background(Color("blue"))
                .cornerRadius(16)
                .foregroundColor(.white)
                .padding()
                
                
                ForEach(c2.tournamentMatches){ teams in
                    PlayerCell(team: teams,number: num)
                }
                
            }.navigationTitle("Players")
            
        }
    }
}


struct AddPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayersView()
    }
}
