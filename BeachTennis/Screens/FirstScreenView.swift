//
//  FirstScreenView.swift
//  BeachTennis
//
//  Created by Madu Maciel on 14/08/23.
//

import SwiftUI

struct FirstScreenView: View {
    
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
                        Text("What we're gonna play today?")
                            .font(.system(size: 16))
                    }
                    PhotoPicker2()
                }
                Text("Championships")
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
                HStack{
                    Text("My championships")
                    //implementar botão de see all
                }
                NoGames()
                
                Text("What's happening now?")
                NoNow()
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
