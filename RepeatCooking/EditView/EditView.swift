//
//  EditView.swift
//  RepeatCooking
//
//  Created by tiking on 2021/03/06.
//

import SwiftUI

struct EditView: View {
    @Environment(\.managedObjectContext) var managedObject
    @Environment (\.presentationMode) var presentationMode
    @State var text: String = ""
    @State var isShow: Bool = false
    @State var image: UIImage = UIImage(imageLiteralResourceName: "Camera")
    @State var date = Date().string
    
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    let cookItem = RepeatCooking(context: managedObject)
                    cookItem.text = text
                    cookItem.cookedAt = date
                    cookItem.image = image.pngData()!
                    do {
                        try managedObject.save()
                        print("\(text)を保存しました")
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print("saveに失敗しました")
                        print(error)
                    }
                }){
                    Text("save")
                        .frame(width: 50, height: 30, alignment: .leading)
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
            }
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
                        .cornerRadius(8)
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
