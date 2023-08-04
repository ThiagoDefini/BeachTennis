//
//  SwiftUIView.swift
//  BeachTennis
//
//  Created by Madu Maciel on 27/07/23.
//


import SwiftUI

struct PhotoPicker: View {
    @State var showImage = false
    @State var image: UIImage?
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Button{
                    showImage.toggle()
                } label: {
                    VStack {
                        if let image = self.image {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 91, height: 91)
                                .cornerRadius(80)
                            Image(systemName: "plus.circle")
                                .foregroundColor(.black)
                                .font(.system(size: 25))
                                .padding(.top, -35)
                                .padding(.leading, 70)
                        } else {
                            Text("Insert image")
                            
                        }
                    }
                }
            }
            .padding(.bottom, 5)
            
        }
        .padding()
        .fullScreenCover(isPresented: $showImage, onDismiss: nil) {
            CotrollerPhotoPicker(image: $image)
                .ignoresSafeArea()
        }
        
    }
}


struct PhotoPicker_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPicker()
    }
}


struct CotrollerPhotoPicker: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    private let controller = UIImagePickerController()
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let parent: CotrollerPhotoPicker
        
        init(parent: CotrollerPhotoPicker) {
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

