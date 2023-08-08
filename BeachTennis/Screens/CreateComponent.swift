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
    
    @State var link = URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!
    var body: some View {
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 372, height: 104)
                    .foregroundColor(.white)
                    VStack{
                        
                        HStack(spacing: 20){
                            Text("Torneio das gurias")
                                .foregroundColor(.black)
                                .bold()
                                .font(.system(size: 24))
                                .padding(.trailing, 130)
                        
                        }
                        HStack{
                            Text("09378")
                                .padding(.trailing, 180)
                                .font(.system(size: 24))
                                .foregroundColor(Color("orange"))
                                .bold()
                            ShareLink(item: link){
                                Label("", systemImage: "square.and.arrow.up")
                                    .frame(width: 30, height: 25)
                                    .foregroundColor(Color("blue"))
                            }
                            .padding(.trailing, 25)
                        }
                            
                                
                            
                            
//                            .padding(.leading, 40)
//                            Divider()
//
//                            HStack(spacing: 20){
//                                Text("Tennis court")
//                                    .foregroundColor(.black)
//                                TextField("name", text: self.$tennisCourt)
//                                    .foregroundColor(.black)
//                            }
//                            .padding(.leading, 40)
//                            Divider()
    
//                        HStack(spacing: 20){
//                            Text("Adress")
//                                .foregroundColor(.black)
//                            TextField("name", text: self.$adress)
//                                .foregroundColor(.black)
//                        }
//                        .padding(.leading, 40)
//                        Divider()
//
//
//                        HStack{
//                            Text("Start date")
//                                .foregroundColor(.black)
//                            DatePicker("", selection: $startDate, displayedComponents: .date)
//                            // .foregroundColor(.black)
//                                .padding(.trailing)
//                        }
//                        .padding(.leading, 40)
//                        Divider()
//
//                        HStack{
//                            Text("End date")
//                                .foregroundColor(.black)
//                            DatePicker("", selection: $endDate, displayedComponents: .date)
//                                .padding(.trailing)
//                        }
//                        .padding(.leading, 40)
//
           }
        }
    }
}

struct CreateComponent_Previews: PreviewProvider {
    static var previews: some View {
        CreateComponent()
    }
}
