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
    
    let characterLimit = 18
    var body: some View {
        NavigationView{
                    VStack{
                        Group{
                            NavigationLink(destination: CreateChamp(), label: {Text("Create")})
                                .padding(.leading, 300)
                            Divider()
                            Text("New championship")
                                .font(.title)
                                .bold()
                            Spacer()
                            
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
                    }
                }
            }
        }
    



struct CreatedChamp: View {
    var body: some View{
        VStack{
            Image("")
            Text("Championship created")
        }
        
    }
    
    
}

struct CreateChamp_Previews: PreviewProvider {
    static var previews: some View {
        CreateChamp()
    }
}
