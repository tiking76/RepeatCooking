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
            Image("Camera")
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            Form(content: {
                Section(header: Text("日時")) {
                    DatePicker("", selection: $date,
                        displayedComponents: .date)
                        .frame(width: 230, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                Section(header: Text("point")) {
                TextEditor(text: $text)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
            })
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
