//
//  HomeViewItem.swift
//  RepeatCooking
//
//  Created by tiking on 2021/03/12.
//

import SwiftUI

struct HomeViewItem: View {
    @Environment(\.managedObjectContext) var managedObject
    @Environment(\.presentationMode) var presentation
    var image: UIImage
    var dateString: String
    @State var isRemove = false
    @State var text2: String = ""
    let callback: () -> Void

    var body: some View {
        VStack {
            ZStack {
                Image(uiImage: image)
                    .resizable()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 150, alignment: .center)
                    .cornerRadius(8)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(dateString)
                            .dateLable()
                        Spacer()
                    }
                    .padding()
                    Spacer()
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 10))
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            HStack {
                Text(text2)
                    .foregroundColor(.black)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 30, alignment: .center)
                    .padding(EdgeInsets(top: 0, leading: 100, bottom: 10, trailing: 0))
                Button(action: {}) {
                    Image(systemName: "trash.fill")
                        .frame(width: 50, height: 50, alignment: .trailing)
                        .foregroundColor(.black)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 20))
                }
                .alert(isPresented: $isRemove, content: {
                    Alert(title: Text("削除します"), primaryButton: .cancel(Text("やめる")), secondaryButton: .destructive(Text("削除"), action: {
                        print("remove \(text2)")
                    })
                    )
                })
            }
        }
        .background(Color.white)
        .cornerRadius(8)
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
    }
}
