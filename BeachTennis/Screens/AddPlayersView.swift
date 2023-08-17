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
    
    var tournament: Tournament
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Please click the button below to add the players to the doubles team:")
                    .font(.system(size: 18))
                    .offset(y: -270)
                    .padding()
                    .padding(.top, 30)
                HStack{
                    NavigationLink(destination: SinglePlayerView(tournament: tournament), label: {
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
            }
            .navigationTitle("Include teams")
            
        }
        .navigationBarHidden(true)
        
    }
}
struct AddPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayersView(tournament: c1!)
    }
}
