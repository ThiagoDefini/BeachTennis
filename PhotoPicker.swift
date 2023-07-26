//
//  PhotoPicker.swift
//  BeachTennis
//
//  Created by Madu Maciel on 25/07/23.
//

import SwiftUI

struct PhotoPicker: View {
    @State var showImage = false
    @State var image: UIImage?
    @FetchRequest( sortDescriptors: []) var profile: FetchedResults<Profile>
    //database problem
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Button{
                    showImage.toggle()
                } label: {
                    VStack {
                        if let image = self.image{
                           
                            
                        }
                    }
                }
                
            }
        }
    }
}
struct PhotoPicker_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPicker()
    }
}
