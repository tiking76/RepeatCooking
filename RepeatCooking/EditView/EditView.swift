//
//  EditView.swift
//  RepeatCooking
//
//  Created by tiking on 2021/03/06.
//

import SwiftUI

struct EditView: View {
    @State var text: String = "aaaaaaaaaaaaaaaa"
    @State var isShow: Bool = false
    @State var image: UIImage = UIImage(imageLiteralResourceName: "Camera")
    //@ObservedObject var keyboard = KeyboardObserver()
    var body: some View {
        VStack {
            Button(action: {
                isShow.toggle()
            }, label: {
                Image(uiImage: image)
                    .resizable()
                    .frame(maxWidth: .infinity,
                           minHeight: 200,
                           maxHeight: 200,
                           alignment: .center
                    )
            })
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            .fullScreenCover(isPresented: $isShow,
                             content: {
                                CameraView(isActive: $isShow,
                                           image: $image
                                )})
            Form(content: {
                Section(header: Text("ひとこと")) {
                TextEditor(text: $text)
                    .frame(maxWidth: .infinity,
                           minHeight: 100,
                           maxHeight: 100,
                           alignment: .center
                    )
                }
            })
            .onTapGesture {
                UIApplication.shared.closeKeyboard()
            }
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
