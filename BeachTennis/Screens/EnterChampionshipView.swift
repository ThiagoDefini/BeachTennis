//
//  EnterChampionshipView.swift
//  BeachTennis
//
//  Created by Thiago Defini on 03/08/23.
//

import SwiftUI

struct EnterChampionshipView: View {
    @ObservedObject var OTPData: OTPDataModel = OTPDataModel()
    @StateObject var data = CustomKeyboardModel()
    @State var isShowingKeyboard: Bool = false
    @State var isSelected: Bool = false
    @State var text = ""
    
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
                        TextField("0", text: self.$text)
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
                    
                    if text == ""{
                        Button{
                            
                        }label: {
                            Text("Continue")
                                .frame(width: 350, height: 64)
                                .background(Color("blue"))
                                .cornerRadius(16)
                                .foregroundColor(.white)
                        }
                    }else{
                            if vm.tournaments.contains(where: {$0.id == text}){
                                NavigationLink(destination:
                                                ChampInfoView(tournament: c1!)
                                    .environmentObject(vm)
                                    .onAppear{
                                        vm.updateData()
                                    }
                                               , label: { Text("Continue")}) //SÓ TESTE
                                    .frame(width: 350, height: 64)
                                    .background(Color("blue"))
                                    .cornerRadius(16)
                                    .foregroundColor(.white)
                            }else{
                                Button{
                                    
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
                
                
                if isShowingKeyboard{
                    CustomNumericalKeyboardView(isShowingKeyboard: $isShowingKeyboard, OTPData: OTPData, data:data)
                }
            }
            
            .navigationTitle("Enter championship")
        }
    }
}

    
struct EnterChampionshipView_Previews: PreviewProvider {
    static var previews: some View {
        EnterChampionshipView()
    }
}

