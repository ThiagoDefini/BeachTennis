//
//  Managing.swift
//  BeachTennis
//
//  Created by Madu Maciel on 28/07/23.
//

import SwiftUI

struct Managing: View {
    @State private var isCreated = false
    @State private var champTapped = false
    
   
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink (destination: ChampInfoView(), label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 16)
                        Image("BannerImage")
                            .resizable()
                        //.scaledToFit()
                            .frame(width: 350, height: 109)
                        VStack{
                            Text("Sun, Sand, and Smashes")
                                .foregroundColor(.white)
                                .bold()
                                .padding(.bottom, 0.0)
                                .padding(.trailing, 14)
                            Text("Parque Esportivo da PUCRS")
                                .foregroundColor(.white)
                            Text("July, 24 - July, 30 ")
                                .foregroundColor(.white)
                                .padding(.trailing, 75)
                        }
                    }
                    .frame(width: 350, height: 109)
                })
                .navigationTitle("Managing")
                Spacer()
            
                Button("New championship"){
                    isCreated.toggle()
                }
                .sheet(isPresented: $isCreated) {
                    CreateChamp()
                    
                }
                .frame(width: 350, height: 64)
                .background(Color("blue"))
                .cornerRadius(16)
                .foregroundColor(.white)
                .padding()
            }
                
        }
          
        }
    }


struct Managing_Previews: PreviewProvider {
    static var previews: some View {
        Managing()
    }
}
