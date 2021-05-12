//
//  Model.swift
//  RepeatCooking
//
//  Created by tiking on 2021/03/11.
//

import SwiftUI

final class SendModelRequest: ObservableObject {
    @Environment(\.managedObjectContext) var managedObject
    @Published var image: UIImage = UIImage(imageLiteralResourceName: "Camera")
    @Published var dateString: String = Date().string
    @Published var text: String = ""

    struct Model {
        let image: UIImage
        let date: Date
        let text: String
    }

    func save(model: Model) {
        let cookItem = RepeatCooking(context: managedObject)
        do {
            cookItem.text = model.text
            cookItem.cookedAt = model.date.string
            if let image = model.image.pngData() {
                cookItem.image = image
            }
        }
    }
}
