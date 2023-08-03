//
//  CustomTF.swift
//  BeachTennis
//
//  Created by Thiago Defini on 03/08/23.
//

import SwiftUI

struct CustomTF: View {
    var textboxColor = Color(red: 235/255, green: 235/255, blue: 235/255)
    var selectedColor = Color(red: 122/255, green: 177/255, blue: 253/255)
    var code: String
    var isSelected = false
    var body: some View {
        Text(code)
            .bold()
            .font(.title)
            .foregroundColor(Color.black)
            .frame(width: UIScreen.main.bounds.size.width/8, height: UIScreen.main.bounds.size.height/11)
            .background(textboxColor)
            .cornerRadius(UIScreen.main.bounds.size.height/81.2)
            .overlay(RoundedRectangle(cornerRadius: UIScreen.main.bounds.size.height/81.2).stroke(isSelected ? selectedColor : Color.clear, lineWidth: 4))
    }
}

class OTPDataModel: ObservableObject{
    @Published var code = ""
}
