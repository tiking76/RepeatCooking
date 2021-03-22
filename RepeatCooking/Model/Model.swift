//
//  Model.swift
//  RepeatCooking
//
//  Created by tiking on 2021/03/11.
//

import SwiftUI

struct Model {
    let image: UIImage
    let date: Date
    let text: String
}

final class FetchModel: ObservableObject {
    @Published var image: UIImage = UIImage(imageLiteralResourceName: "Camera")
    @Published var dateString: String = Date().string
    @Published var text: String = ""
    
//    init(_image: UIImage,
//         _date: Date,
//         _text: String) {
//        image = _image
//        date = _date
//        text = _text
//    }
}
