//
//  StoreView.swift
//  RepeatCooking
//
//  Created by tiking on 2021/03/11.
//

import SwiftUI

struct StoreView: View {
    var text: String = "おいしかった\nありがとう"
    var image: UIImage = UIImage(imageLiteralResourceName: "Camera")
    var date = Date().string
    
    var body: some View {
        VStack {
            ZStack(alignment: .top, content: {
                Image(uiImage: image)
                    .resizable()
                    .frame(maxWidth: .infinity,
                           minHeight: 200,
                           maxHeight: 200,
                           alignment: .center
                    )
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                HStack {
                    Text(date)
                    Spacer()
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            })
            Form(content: {
                Section(header: Text("ひとこと")) {
                    Text(text)
                    .frame(maxWidth: .infinity,
                           minHeight: 100,
                           maxHeight: 100,
                           alignment: .center
                    )
                }
            })
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
