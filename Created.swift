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
            Button("dimiss"){
            dismiss()
            }
            Image("")
            Text("Championship created")
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
