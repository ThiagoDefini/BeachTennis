//
//  EnterChampionshipView.swift
//  BeachTennis
//
//  Created by Thiago Defini on 03/08/23.
//

import SwiftUI

struct EnterChampionshipView: View {
    @State var text = ""
    @State var showAlert = false
    @EnvironmentObject var vm: CloudKitCrudBootcampViewModel
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    Spacer()
                    Text("Write the championship code to enter the competition")
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    VStack{
                        TextField("Insert Code", text: self.$text)
                            .font(.title)
                            .bold()
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width:300)
                    .cornerRadius(16)
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.blue, lineWidth: 1)
                    }
                    Spacer()
                    
                    if text == "" {
                        Button{
                            
                        } label: {
                            Text("Continue")
                                .frame(width: 350, height: 64)
                                .background(Color("blue"))
                                .cornerRadius(16)
                                .foregroundColor(.white)
                        }
                    } else {
                        
                        if let index = vm.tournaments.firstIndex(where: {$0.id == text}) {
                            
                            NavigationLink {
                                JoinChamp(tournament: vm.tournaments[index])
                                    .onAppear{
                                        vm.updateData()
                                    }
                            } label: {
                                Text("Continue")
                                   .frame(width: 350, height: 64)
                                   .background(Color("blue"))
                                   .cornerRadius(16)
                                   .foregroundColor(.white)
                            }
                            
                        } else {
                            Button {
                                showAlert.toggle()
                            }label: {
                                Text("Continue")
                                    .frame(width: 350, height: 64)
                                    .background(Color("blue"))
                                    .cornerRadius(16)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    Spacer()
                }
            }
            
            .navigationTitle("Enter championship")
            .alert("Championship not found", isPresented: $showAlert) {}
        }
    }
}


struct EnterChampionshipView_Previews: PreviewProvider {
    static var previews: some View {
        EnterChampionshipView()
    }
}

