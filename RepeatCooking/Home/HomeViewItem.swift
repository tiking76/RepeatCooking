//
//  HomeViewItem.swift
//  RepeatCooking
//
//  Created by tiking on 2021/03/12.
//

import SwiftUI

struct HomeViewItem: View {
    private var image: UIImage
    private var dateString: String
    private var text: String
    
    init(_image: UIImage,
         _dateString: String,
         _text: String) {
        image = _image
        dateString = _dateString
        text = _text
    }
    
    var body: some View {
        VStack {
            ZStack {
                Image(uiImage: image)
                    .resizable()
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                           minHeight: 0,
                           maxHeight: 150,
                           alignment: .center)
                    .cornerRadius(8)
                    .padding(EdgeInsets(top: 10,
                                        leading: 10,
                                        bottom: 10,
                                        trailing: 10))
                    HStack {
                        VStack(alignment: .leading, spacing: 0) {
                            Text(dateString)
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        .padding()
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 10,
                                        leading: 10,
                                        bottom: 10,
                                        trailing: 10))
            }
            .padding(EdgeInsets(top: 10,
                                leading: 10,
                                bottom: 10,
                                trailing: 10))
            Text(text)
                .foregroundColor(.black)
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 0,
                       maxHeight: 30,
                       alignment: .center)
        }
        .background(Color.white)
        .cornerRadius(8)
        .padding(EdgeInsets(top: 10,
                            leading: 10,
                            bottom: 10,
                            trailing: 10))
    }
}

struct HomeViewItem_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewItem(_image: UIImage(imageLiteralResourceName: "Camera"),
                     _dateString: Date().string,
                     _text: "クッキー")
    }
}
