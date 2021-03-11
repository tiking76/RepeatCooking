//
//  EditView.swift
//  RepeatCooking
//
//  Created by tiking on 2021/03/06.
//

import SwiftUI

struct EditView: View {
    @State var text: String = "美味しかった"
    @State var isShow: Bool = false
    @State var image: UIImage = UIImage(imageLiteralResourceName: "Camera")
    var date = Date().string
    var body: some View {
        VStack {
            Button(action: {
                isShow.toggle()
            }, label: {
                ZStack(alignment: .top, content: {
                    Image(uiImage: image)
                        .resizable()
                        .frame(maxWidth: .infinity,
                               minHeight: 200,
                               maxHeight: 200,
                               alignment: .center
                        )
                    HStack {
                        Text(date)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                })
            })
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            .fullScreenCover(isPresented: $isShow,
                             content: {
                                CameraView(isActive: $isShow,
                                           image: $image
                                )})
            Form(content: {
                Section(header: Text("ひとこと")) {
                TextView(text: $text)
                    .frame(maxWidth: .infinity,
                           minHeight: 100,
                           maxHeight: 100,
                           alignment: .center
                    )
                    .background(Color.clear)
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
