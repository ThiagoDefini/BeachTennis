//
//  FirstScreenView.swift
//  BeachTennis
//
//  Created by Madu Maciel on 14/08/23.
//

import SwiftUI

struct FirstScreenView: View {
    @State private var name: String = ""
    @State private var joinGame = false
    @State private var createGame = false
    @State private var seeAll = false
    
    var body: some View {
        NavigationView{
        ZStack{
            Color("bege")
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text("Hi,")
                            .font(.system(size: 28))
                            .foregroundColor(Color("gray"))
                        Text("What we're gonna play today?")
                            .foregroundColor(Color("gray"))
                            .font(.system(size: 16))
                    }
                    PhotoPicker2()
                    .offset(x: 50)
                    
                }
                .offset(x: -20 ,y: -150)
                VStack(alignment: .leading){
                    Text("Championships")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(Color("gray"))
                }
                .offset(x: -110, y: -120)
                HStack{
                    Button(action: { joinGame.toggle()
                        
                    }, label: {
                        ZStack{
                            RoundedCorner(radius: 16)
                                .stroke(lineWidth: 5)
                                .frame(width: 165, height: 100)
                                .background(.white)
                                .foregroundColor(Color("blue"))
                                .cornerRadius(16)
                            VStack{
                                Image(systemName: "figure.tennis")
                                    .font(.system(size: 22))
                                    .foregroundColor(Color("blue"))
                                Text("Join")
                                    .foregroundColor(Color("blue"))
                            }
                            
                        }
                    })
                    .sheet(isPresented: $joinGame, content:{ EnterChampionshipView()})
                    Spacer()
                           .frame(width: 20)
                
                   NavigationLink(destination: CreateChamp(), label: {
                       ZStack{
                           RoundedCorner(radius: 16)
                               .stroke(lineWidth: 5)
                               .frame(width: 165, height: 100)
                               .background(.white)
                               .foregroundColor(Color("blue"))
                               .cornerRadius(16)
                           VStack{
                               Image(systemName: "tennis.racket")
                                   .font(.system(size: 22))
                                   .foregroundColor(Color("blue"))
                               Text("Create")
                                   .foregroundColor(Color("blue"))
                           }
                       }
                   })
                }
                .offset(y: -110)
                VStack(alignment: .leading){
                    HStack{
                        Text("My championships")
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(Color("gray"))
                        //implementar botão de see all
                    }
                    .offset( y: -90)
    
                    NoGames()
                        .offset(y: -60)
                }
                VStack(alignment: .leading){
                    Text("What's happening now?")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(Color("gray"))
                }
                .offset(x: -75, y: -20)
                
                NoNow()
                    .offset(y: 40)
            }
            }
        }
    }
}
struct FirstScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreenView()
    }
}
