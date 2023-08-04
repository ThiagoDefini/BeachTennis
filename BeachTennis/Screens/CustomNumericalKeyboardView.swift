//
//  CustomNumericalKeyboardView.swift
//  BeachTennis
//
//  Created by Thiago Defini on 03/08/23.
//

import SwiftUI

struct CustomNumericalKeyboardView: View {
    @Binding var isShowingKeyboard: Bool
    @ObservedObject var OTPData: OTPDataModel
    // variable data is the data model
    @ObservedObject var data : CustomKeyboardModel
    // rows are the array of values that can be used in numerical kayboard
    var rows = ["1","2","3","4","5","6","7","8","9","","0","delete.left",]
    var keyboardColor = Color(red: 235/255, green: 235/255, blue: 235/255)
    var body: some View {
        // MARK: - MainVStack
        VStack{
            VStack{
                Spacer().frame( height: UIScreen.main.bounds.size.height/1.8)
            }
            // GeometryReader for allining width and height of the keyboardview
            GeometryReader{reader in
                VStack{
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: UIScreen.main.bounds.size.width/18.75), count: 3),spacing:UIScreen.main.bounds.size.width/25){
                        ForEach(rows,id:\.self){value in
                            // Below Button is for keyboard Button and functionality
                            Button(action: {
                                //keyboard Button Action
                                buttonAction(value:value)})
                            {
                                ZStack{
                                    //"delete.left" is the default available image for back button in iOS
                                    if value == "delete.left"{
                                        Image(systemName:value)
                                            .font(.title2)
                                            .foregroundColor(.black)
                                    }
                                    else{
                                        //keyboard Button Text
                                        Text(value)
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                    }
                                }
                                //CustomNumericalKeyboard Frame
                                .frame(width: getWidth(frame: reader.frame(in: .global)), height: getHeight(frame: reader.frame(in: .global)))
                                .background(value == "" ? keyboardColor:Color.white)
                                .cornerRadius(10)
                            }

                        }
                    }

                }

            }
            .padding()
            //CustomNumericalKeyboard background Color
            .background(keyboardColor)
        }
        //MainVstack
    }
    //To get the width of CustomNumericalKeyboard
    func getWidth(frame:CGRect)->CGFloat{
        let width = frame.width
        let actualWidth = width - (UIScreen.main.bounds.size.width/9.375)
        return actualWidth / 3
    }
    //To get the Height of CustomNumericalKeyboard
    func getHeight(frame:CGRect)->CGFloat{
        let height = frame.height
        let actualHeight = height - ((UIScreen.main.bounds.size.height < 800) ? (UIScreen.main.bounds.size.height/14.72):(UIScreen.main.bounds.size.height/27.0666667))
        return actualHeight / 4
    }
    //CustomNumericalKeyboard Button Action
    func buttonAction(value:String){
        //CustomNumericalKeyboard Button Action when delete is pressed
        if value == "delete.left" && OTPData.code != ""{
            OTPData.code.removeLast()
        }
        //CustomNumericalKeyboard Button Action when pressing numerical
        if value != "delete.left"{
            if OTPData.code.count < 5{
                OTPData.code.append(contentsOf: value)
            }
            if OTPData.code.count == 5{
                isShowingKeyboard = false
            }
        }
    }
}

class CustomKeyboardModel: ObservableObject {
    @Published var code = ""
}
