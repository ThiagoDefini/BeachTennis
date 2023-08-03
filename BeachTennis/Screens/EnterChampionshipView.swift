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
    
    func getCodeAtIndex(index: Int) -> String{
        if OTPData.code.count > index{
            let start = OTPData.code.startIndex
            let current = OTPData.code.index(start,offsetBy: index)
            return String(OTPData.code[current])
        }
        return ""
    }
    
//    func getChampionship(id: Int, champs: [Tournament]) -> Tournament{
//        ForEach(champs){ champ in
//            if champ.id == id{
//                return champ
//            }
//        }
//        return c1
//    }

    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    Spacer()
                    Text("Write the championship code to enter the competition")
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    HStack(spacing: UIScreen.main.bounds.size.width/35){
                        ForEach(0..<5, id: \.self) { index in
                            Button(action: {
                                isSelected = true
                                if !isShowingKeyboard {isShowingKeyboard = true}
                            }, label: {
                                CustomTF(code: getCodeAtIndex(index: index), isSelected: ((OTPData.code.count == index)&&(isSelected)) ? true:false)
                            })
                        }
                    }
                    
                    Spacer()
                    
                    if OTPData.code.count < 5{
                        Button{
                            
                        }label: {
                            Text("Continue")
                                .frame(width: 350, height: 64)
                                .background(Color("blue"))
                                .cornerRadius(16)
                                .foregroundColor(.white)
                        }
                    }
                    if OTPData.code.count == 5{
                        NavigationLink(destination: EnterChampionshipDetailsView(championship: c1), label: { Text("Continue")})
                            .frame(width: 350, height: 64)
                            .background(Color("blue"))
                            .cornerRadius(16)
                            .foregroundColor(.white)
                        
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

