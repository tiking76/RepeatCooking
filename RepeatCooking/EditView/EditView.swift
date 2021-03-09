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
                        .frame(width: .infinity, height: 200, alignment: .center)
                })
                .fullScreenCover(isPresented: $isShow, content: {
                    CameraView(isActive: $isShow, image: $image)
                })
                Section(header: Text("日時")) {
                    DatePicker("", selection: $date,
                        displayedComponents: .date)
                        .frame(width: 300, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .labelsHidden()

                }
                Section(header: Text("ひとこと")) {
                TextEditor(text: $text)
                    .frame(width: 300, height: 100, alignment: .leading)
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
