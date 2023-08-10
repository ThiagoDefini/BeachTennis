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
                            Spacer()
                               // .padding(.bottom, -11.0)
                            PhotoPicker()
                                .foregroundColor(Color("orange"))
                           
                            HStack(spacing: 20){
                                Text("Name")
                                    .foregroundColor(.black)
                                TextField("name", text: self.$name)
                                    .foregroundColor(.black)
                            }
                            .padding(.leading, 40)
                            Divider()
                            
                            HStack(spacing: 20){
                                Text("Tennis court")
                                    .foregroundColor(.black)
                                TextField("name", text: self.$tennisCourt)
                                    .foregroundColor(.black)
                            }
                            .padding(.leading, 40)
                            Divider()
                        }
                        HStack(spacing: 20){
                            Text("Adress")
                                .foregroundColor(.black)
                            TextField("name", text: self.$adress)
                                .foregroundColor(.black)
                        }
                        .padding(.leading, 40)
                        Divider()
                        
                        
                        HStack{
                            Text("Start date")
                                .foregroundColor(.black)
                        
                            Spacer()
                            DatePicker("", selection: $startDate)
                                .padding(.trailing)
                        }
                        .padding(.leading, 40)
                        Divider()
                        
                        HStack{
                            Text("End date")
                                .foregroundColor(.black)
                            Spacer()
                            DatePicker("", selection: $endDate)
                                .padding(.trailing)
                        }
                        .padding(.leading, 40)
                        
                        Spacer()
                    
                        Button("Create championship"){
                        createButton.toggle()
                    }
                    .sheet(isPresented: $createButton) {
                        Created()

                    }
                    .frame(width: 350, height: 64)
                    .background(Color("orange"))
                    .cornerRadius(16)
                    .foregroundColor(.white)
                    .padding()
                        
                    }
                    .navigationTitle("New championship")
                }
            }
        }
    




struct CreateChamp_Previews: PreviewProvider {
    static var previews: some View {
        CreateChamp()
    }
}
