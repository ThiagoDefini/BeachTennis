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
                Divider()
                Text("New championship")
                    .font(.title)
                    .bold()
                VStack{
                    TextField("", text: $name)
                        .keyboardType(.decimalPad)
                        .bold()
                        .multilineTextAlignment(.center)
                        .font(.system(size: 30))
                        .padding()
                        .padding(.top, 20)
                }
                .onChange(of: name) { newValue in
                    if newValue.count > characterLimit {
                        name = String(newValue.prefix(characterLimit))
                    }
                    name = formatCurrency(name)
                }
                HStack(spacing: 20){
                    Text("Name")
                    TextField("name", text: self.$name)
                }
                .padding(.leading, 40)
                Divider()
                
                HStack(spacing: 20){
                    Text("Tennis court")
                    TextField("name", text: self.$name)
                }
                .padding(.leading, 40)
                Divider()
                
                HStack(spacing: 20){
                    Text("Adress")
                    TextField("name", text: self.$name)
                }
                .padding(.leading, 40)
                Divider()
                
                VStack{
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
    func formatCurrency(_ value: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
       return "ok"
    }
        
        
        
    
    
}

struct CreateChamp_Previews: PreviewProvider {
    static var previews: some View {
        CreateChamp()
    }
}
