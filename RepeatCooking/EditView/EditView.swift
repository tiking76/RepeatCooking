//
//  EditView.swift
//  RepeatCooking
//
//  Created by tiking on 2021/03/06.
//

import SwiftUI

struct EditView: View {
    @State var date = Date()
    @State var text: String = ""
    @State var isShow: Bool = false
    @State var image: UIImage = UIImage(imageLiteralResourceName: "Camera")
    var body: some View {
        VStack {
            Form(content: {
                Button(action: {
                    isShow.toggle()
                }, label: {
                    Image(uiImage: image)
                        .resizable()
                        .frame(maxWidth: .infinity,
                               minHeight: 200,
                               maxHeight: 200,
                               alignment: .center)
                })
                .fullScreenCover(isPresented: $isShow, content: {
                    CameraView(isActive: $isShow, image: $image)
                })
                Section(header: Text("日時")) {
                    Text(date.string)
                        .frame(minWidth: 0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 20, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center)

                }
                Section(header: Text("ひとこと")) {
                TextEditor(text: $text)
                    .frame(maxWidth: .infinity,
                           minHeight: 100,
                           maxHeight: 100,
                           alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .onTapGesture {
                        UIApplication.shared.closeKeyboard()
                    }
                }
            })
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EditView()
        }
    }
}
