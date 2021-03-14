//
//  HomeView.swift
//  RepeatCooking
//
//  Created by tiking on 2021/03/11.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @Environment(\.managedObjectContext) var managedObject
    @FetchRequest(fetchRequest: RepeatCooking.getAllMemoItems()) var cookItems: FetchedResults<RepeatCooking>
    @State var flag = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    flag.toggle()
                }) {
                    Image(systemName: "plus.circle")
                        .imageScale(.large)
                        .frame(width: 100, height: 100, alignment: .center)
                }
                .sheet(isPresented: $flag, content: {
                    EditView(_text: "", _isShow: false, _image: UIImage(imageLiteralResourceName: "Camera"), _date: Date())
                })
            }
            Spacer()
            ScrollView {
                    ForEach(cookItems) {
                        item in
                        Button(action: {
                            flag.toggle()
                        }) {
                            HomeViewItem(_image: item.image.toImage(), _dateString: item.cookedAt, _text: item.text)
                        }
                        .sheet(isPresented: $flag, content: {
                            EditView(_text: item.text, _isShow: false, _image: item.image.toImage(), _date: Date(dateString: item.cookedAt)!)
                        })
                    }
            }
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
