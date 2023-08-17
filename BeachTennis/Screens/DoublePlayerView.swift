//
//  DoublePlayerView.swift
//  BeachTennis
//
//  Created by Madu Maciel on 16/08/23.
//

import SwiftUI

struct DoublePlayerView: View {
    @State private var fullName: String = ""
    @State private var addDoubleButton = false
    var body: some View {
        NavigationView{
            VStack{
                Text("Insert the full name of the player bellow:")
                    .padding(.bottom,50)
                VStack{
                    VStack{
                        Text("Double team #1:")
                            .padding(.trailing, 265)
                            .foregroundColor(.black)
                        ZStack{
                            RoundedCorner(radius: 12)
                                .stroke(lineWidth: 0.5)
                                .foregroundColor(Color("blue"))
                                .frame(width: 400, height: 43)
                            HStack{
                                Image(systemName: "person.fill")
                                    .foregroundColor(Color("orange"))
                                    
                                TextField("Full name", text: self.$fullName)
                                    .foregroundColor(.black)
                            }
                            .padding(.leading, 50)
                        }
                    }
                    VStack{
                        ZStack{
                            RoundedCorner(radius: 12)
                                .stroke(lineWidth: 0.5)
                                .foregroundColor(Color("blue"))
                                .frame(width: 400, height: 43)
                            HStack{
                                Image(systemName: "person.fill")
                                    .foregroundColor(Color("orange"))
            
                                TextField("Full name", text: self.$fullName)
                                    .foregroundColor(.black)
                            }
                            .padding(.leading, 50)
                        }
                    }
                    
                }
                .padding(.bottom,400)
               
                Button(action: { addDoubleButton.toggle()
                    
                }, label: {
                    Text("Add double team")
                        .frame(width: 350, height: 64)
                        .background(Color("blue"))
                        .foregroundColor(.white)
                        .cornerRadius(16)
                    
                })
            }
            .navigationTitle("Double team")
            .navigationBarBackButtonHidden()
        }
    }
}


struct DoublePlayer2View: View{
   @State private var addCourt = false
    var body: some View{
        NavigationView{
            
            VStack{
                Text("Please click the button below to add the players to the doubles team:")
                    .font(.system(size: 18))
                    .padding(.bottom,50)
            
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
                .padding(.bottom,400)
//                    ForEach(c2.tournamentMatches){ teams in
//                        PlayerCell(team: teams, number: 1)
//                            }
                Button(action: { addCourt.toggle()
                    
                }, label: {
                    Text("Next")
                        .frame(width: 350, height: 64)
                        .background(Color("blue"))
                        .foregroundColor(.white)
                        .cornerRadius(16)
                    })
                .sheet(isPresented: $addCourt, content: {AddCourtsView()})
            }
            .navigationTitle("Include teams")
            
        }
        
    }
}

struct DoublePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        DoublePlayer2View()
    }
}
