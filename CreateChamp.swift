//
//  CreateChamp.swift
//  BeachTennis
//
//  Created by Madu Maciel on 28/07/23.
//

import SwiftUI

struct CreateChamp: View {
    @State private var name: String = ""
    @State private var tennisCourt: String = ""
    @State private var adress: String = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var image = Image("")
    
    @State private var createButton = false
    
    let characterLimit = 18
    var body: some View {
        NavigationView{
                    VStack{
                        Group{
//                            NavigationLink(destination: Created(), label: {Text("Create")})
//                                .padding(.leading, 300)
//                          Button(action: {createTournament(tournamentType: tournamentTypes, tournamentID: Int, startingTime: Date)}, label: {
//                              Text("Create")
//                          })
                            Divider()
                            Text("New championship")
                                .font(.title)
                                .bold()
                           // Spacer()
                            
                            HStack(spacing: 20){
                                Text("Name")
                                TextField("name", text: self.$name)
                            }
                            .padding(.leading, 40)
                            Divider()
                            
                            HStack(spacing: 20){
                                Text("Tennis court")
                                TextField("name", text: self.$tennisCourt)
                            }
                            .padding(.leading, 40)
                            Divider()
                        }
                        HStack(spacing: 20){
                            Text("Adress")
                            TextField("name", text: self.$adress)
                        }
                        .padding(.leading, 40)
                        Divider()
                        
                        
                        HStack{
                            Text("Start date")
                            DatePicker("", selection: $startDate, displayedComponents: .date)
                                .padding(.trailing)
                        }
                        .padding(.leading, 40)
                        Divider()
                        
                        HStack{
                            Text("End date")
                            DatePicker("", selection: $endDate, displayedComponents: .date)
                                .padding(.trailing)
                        }
                        .padding(.leading, 40)
                        
                        PhotoPicker()
                           .padding(.trailing, 250)
                        
                    }
                }
            }
        }
    




struct CreateChamp_Previews: PreviewProvider {
    static var previews: some View {
        CreateChamp()
    }
}
