//
//  Created.swift
//  BeachTennis
//
//  Created by Madu Maciel on 01/08/23.
//

import SwiftUI

struct Created: View {
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack{
//            Button("dimiss"){
//            dismiss()
//            }
            Image("checkmark")
                .resizable()
                .frame(width: 200, height: 200)
                .padding(.bottom)
            Text("Championship created!")
                .padding(.bottom, 150)
                .font(.headline)
            
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.green)
                .frame(width: 329, height: 226)
                
          
        }    }
}


struct Toogle: View {
    @State private var showingSheet = false

    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            Created()
        }
    }
}
struct Created_Previews: PreviewProvider {
    static var previews: some View {
        Created()
    }
}
