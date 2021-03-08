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
    var body: some View {
        VStack {
            Button(action: {}, label: {
                Image("Camera")
            })
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            Form(content: {
                Section(header: Text("日時")) {
                    DatePicker("", selection: $date,
                        displayedComponents: .date)
                        .frame(width: 300, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .labelsHidden()

                }
                Section(header: Text("point")) {
                TextEditor(text: $text)
                    .frame(width: 300, height: 100, alignment: .leading)
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
