//
//  AddCourt.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 08/08/23.
//

import SwiftUI

struct AddCourtView: View {
    
    @State private var name: String = ""
    @State private var createButton = false
    @State private var num:Int = 1
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
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
                    TextField("name", text: self.$name)
                        .foregroundColor(.black)
                }
                .padding(.leading, 40)
                Divider()
                
                
                Spacer()
                
                Button("Add Player"){
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

struct AddCourtView_Previews: PreviewProvider {
    static var previews: some View {
        AddCourtView()
    }
}
