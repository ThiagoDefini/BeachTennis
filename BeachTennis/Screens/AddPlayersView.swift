//
//  AddPlayersView.swift
//  BeachTennis
//
//  Created by Madu Maciel on 04/08/23.
//

import SwiftUI

struct AddPlayersView: View {
    
    @State private var name: String = ""
    @State private var name2: String = ""
    @State private var createButton = false
    @State private var num:Int = 1
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Please click the button below to add the players to the doubles team:")
                    .font(.system(size: 18))
                    .offset(y: -270)
                    .padding()
                HStack{
                    NavigationLink(destination: SinglePlayerView(), label: {
                        ZStack{
                            RoundedCorner(radius: 16)
                                .stroke(lineWidth: 5)
                                .frame(width: 165, height: 100)
                                .background(.white)
                                .foregroundColor(Color("blue"))
                                .cornerRadius(16)
                            VStack{
                                Image(systemName: "person.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(Color("blue"))
                                Text("Add single player")
                                    .foregroundColor(Color("blue"))
                                    .bold()
                            }
                        }
                    })
                    Spacer()
                           .frame(width: 20)
                    NavigationLink(destination: DoublePlayerView(), label: {
                        ZStack{
                            RoundedCorner(radius: 16)
                                .stroke(lineWidth: 5)
                                .frame(width: 165, height: 100)
                                .background(.white)
                                .foregroundColor(Color("blue"))
                                .cornerRadius(16)
                            VStack{
                                Image(systemName: "person.2.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(Color("blue"))
                                Text("Add double team")
                                    .foregroundColor(Color("blue"))
                                    .bold()
                            }
                        }
                    })
                }
                .offset(y: -200)
            }.navigationTitle("Include teams")
            
        }
        .navigationBarHidden(true)
                
            }
            
            
        }
   

struct AddPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayersView()
    }
}
//Spacer()
//                HStack(spacing: 20){
//                    Text("Court Name")
//                        .foregroundColor(.black)
//                    TextField("name", text: self.$name)
//                        .foregroundColor(.black)
//                }
//                .padding(.leading, 40)
//                Divider()
//                HStack(spacing: 20){
//                    Text("Description")
//                        .foregroundColor(.black)
//                    TextField("name", text: self.$name2)
//                        .foregroundColor(.black)
//                }
//                .padding(.leading, 40)
//                Divider()
//
//
//                Spacer()
//
