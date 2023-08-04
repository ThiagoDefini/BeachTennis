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
    
   
    
    
    @State private var createButton = false
    
    let characterLimit = 18
    var body: some View {
        NavigationView{
            VStack{
                Group{
                    PhotoPicker()
                    HStack(spacing: 20){
                        Text("Name")
                        TextField("name", text: self.$name, onCommit: {
                            self.createButton = true
                        })
                    }
                    .padding(.leading, 40)
                    Divider()
                    
                    HStack(spacing: 20){
                        Text("Tennis court")
                        TextField("tennis court", text: self.$tennisCourt, onCommit: {
                            self.createButton = true
                        })
                    }
                    .padding(.leading, 40)
                    Divider()
                }
                HStack(spacing: 20){
                    Text("Adress")
                    TextField("adress", text: self.$adress, onCommit: {
                        self.createButton = true
                    })
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
                Spacer()
                NavigationLink(destination: Created(), label: {Text("Create championship")})
                    .frame(width: 350, height: 64)
                    .background(Color("blue"))
                    .foregroundColor(.white)
                    .cornerRadius(16)
                    
                
                
                
            }
            .navigationTitle("New championship")
            .padding(.bottom, 270)
        }
        
        
    }
}





struct CreateChamp_Previews: PreviewProvider {
    static var previews: some View {
        CreateChamp()
    }
}
