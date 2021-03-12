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
                    EditView()
                })
            }
            Spacer()
            ScrollView {
                    ForEach(cookItems) {
                        item in
                        Button(action: {
                            flag.toggle()
                        }) {
                            HomeViewItem(image: item.image.toImage())
                        }
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .sheet(isPresented: $flag, content: {
                            EditView(managedObject: _managedObject, text: item.text, isShow: false, image: item.image.toImage(), date: item.cookedAt)
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
