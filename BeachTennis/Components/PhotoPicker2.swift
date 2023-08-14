//
//  PhotoPicker2.swift
//  BeachTennis
//
//  Created by Madu Maciel on 14/08/23.
//

import SwiftUI

struct PhotoPicker2: View {
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Button {
                    shouldShowImagePicker.toggle()
                } label: {
                    VStack{
                        if let image = self.image {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 56, height: 56)
                                .cornerRadius(80)
                            Image(systemName: "plus.circle")
                                .foregroundColor(.black)
                                .font(.system(size: 25))
                                .padding(.top, -35)
                                .padding(.leading, 70)
                        } else {
                            Image("icon.photo")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 56, height: 56)
                                .cornerRadius(80)
                            Image(systemName: "plus.circle")
                                .foregroundColor(.black)
                                .font(.system(size: 15))
                                .padding(.top, -35)
                                .padding(.leading, 70)
                        }
                    }
                }
                .padding(.bottom, 5)
//                VStack {
//                    if profile[profile.endIndex - 1].name ==  "" {
//                        Text("Olá")
//                    } else {
//                        Text("Olá, \(profile[profile.endIndex - 1].name!)")
//                    }
//                }
//                .padding(.leading, 10)
//                .font(.system(size: 24))
//                .bold()
//                .foregroundColor(Color("color.purple"))
//
            }
        }
        
        .padding()
        .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
            CotrollerPhotoPicker(image: $image)
                .ignoresSafeArea()
        }
    }
}

struct PhotoPicker2_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPicker2()
    }
}
struct CotrollerPhotoPicker2: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    private let controller = UIImagePickerController()
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let parent: CotrollerPhotoPicker2
        
        init(parent: CotrollerPhotoPicker2) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            parent.image = info[.originalImage] as? UIImage
            picker.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

