//
//  HomeView.swift
//  RepeatCooking
//
//  Created by tiking on 2021/03/11.
//

import CoreData
import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) var managedObject
    @Environment(\.presentationMode) var presentationMode
    @FetchRequest(fetchRequest: RepeatCooking.getAllMemoItems()) var cookItems: FetchedResults<RepeatCooking>
    @State var flag = false
    @State var isRemove = false
    @StateObject private var model = SendModelRequest()

    var body: some View {
        ZStack {
            Color.init(UIColor.lightOrange).edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    Text("FoodPad")
                        .font(.custom("Parisienne-Regular", size: 70))
                        .frame(width: 300, height: 100, alignment: .trailing)
                    Spacer()
                    Button(action: {
                        flag.toggle()
                    }) {
                        Image(systemName: "plus.circle")
                            .imageScale(.large)
                            .frame(width: 100,
                                   height: 100,
                                   alignment: .center)
                    }
                    .sheet(isPresented: $flag, content: {
                        EditView(text: "",
                                 isShow: false,
                                 image: UIImage(imageLiteralResourceName: "Camera"),
                                 date: Date(), dismiss: {})
                    })
                }
                Spacer()
                ScrollView {
                    ForEach(cookItems) {
                        item in
                        ZStack {
                            Button(action: {}) {
                                HomeViewItem(image: item.image.toImage(), dateString: item.cookedAt, text2: item.text, callback: { print("completed") }
                                )
                            }
                            .sheet(isPresented: $flag,
                                   content: {
                                    EditView(text: model.text, isShow: false, image: model.image, date: Date(dateString: model.dateString)!, dismiss: {})
                                   }
                            )
                        }
                    }
                    .cornerRadius(8)
                    .shadow(radius: 10)
                    .padding(EdgeInsets(top: 10,
                                        leading: 10,
                                        bottom: 10,
                                        trailing: 10))
                }
            }
        }
    }
    func removeItem(at offsets: IndexSet) {
        for index in offsets {
            let item = cookItems[index]
            managedObject.delete(item)
        }
        do {
            try managedObject.save()
        } catch {
            print("faild delete")
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
