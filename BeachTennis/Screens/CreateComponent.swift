//
//  CreateComponent.swift
//  BeachTennis
//
//  Created by Madu Maciel on 07/08/23.
//

import SwiftUI

struct CreateComponent: View {
    @State private var name: String = ""
    @State private var tennisCourt: String = ""
    @State private var adress: String = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var image = Image("")
    
    var body: some View {
            ZStack{
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 393, height: 264)
                    .foregroundColor(.gray)
                    VStack{
                        Group{
                            Spacer()
                            // .padding(.bottom, -11.0)
                            PhotoPicker()
                                .foregroundColor(Color("blue"))
                            
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
                            DatePicker("", selection: $startDate, displayedComponents: .date)
                            // .foregroundColor(.black)
                                .padding(.trailing)
                        }
                        .padding(.leading, 40)
                        Divider()
                        
                        HStack{
                            Text("End date")
                                .foregroundColor(.black)
                            DatePicker("", selection: $endDate, displayedComponents: .date)
                                .padding(.trailing)
                        }
                        .padding(.leading, 40)
              
           }
        }
    }
}

struct CreateComponent_Previews: PreviewProvider {
    static var previews: some View {
        CreateComponent()
    }
}
