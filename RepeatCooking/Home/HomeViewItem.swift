//
//  HomeViewItem.swift
//  RepeatCooking
//
//  Created by tiking on 2021/03/12.
//

import SwiftUI

struct HomeViewItem: View {
    var image: UIImage = UIImage(imageLiteralResourceName: "Camera")
    var body: some View {
        HStack {
            Image(uiImage: image)
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 150, alignment: .center)
                .cornerRadius(8)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        }
        
    }
}

struct HomeViewItem_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewItem()
    }
}
