//
//  AddCourtsView.swift
//  BeachTennis
//
//  Created by Madu Maciel on 17/08/23.
//

import SwiftUI

struct AddCourtsView: View {
    @State private var court: String = ""
    @State private var isCreated = false
    var body: some View {
        NavigationView{
            ScrollView{
                Text("Insert the courts bellow:")
                   // .padding(.bottom,50)
                VStack(alignment: .leading){
                    Text("Court:")
                        .foregroundColor(.black)
                        .padding(.leading,25)
                    ZStack{
                        RoundedCorner(radius: 12)
                            .stroke(lineWidth: 0.5)
                            .foregroundColor(Color("blue"))
                            .frame(width: 350, height: 43)
                        HStack{
                            Image(systemName: "tennisball.fill")
                                .foregroundColor(Color("orange"))
                                .padding(.trailing)
                    
                            TextField("court name", text: self.$court)
                                .foregroundColor(.black)
                        }
                        .padding(.leading, 50)
                    }
                }
               
               
                if court != ""{
                    NavigationLink {
                        Created(code: "123")
                           
                    } label: {
                        Text("Create championship")
                            .frame(width: 350, height: 64)
                            .background(Color("blue"))
                            .foregroundColor(.white)
                            .cornerRadius(16)
                    }
                   


                }else{
                    Button(action: {
                        

                    }, label: {
                        Text("Create championship")
                            .frame(width: 350, height: 64)
                            .background(Color("blue"))
                            .foregroundColor(.white)
                            .cornerRadius(16)

                    })
                }
                  
            }
            
            .navigationTitle("add courts")
            .navigationBarHidden(true )
            
        }
        
    }

}

struct AddCourtsView_Previews: PreviewProvider {
    static var previews: some View {
        AddCourtsView()
    }
}
