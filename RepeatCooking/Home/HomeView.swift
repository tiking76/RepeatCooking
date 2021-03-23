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
    @ObservedObject private var model = FetchModel()
    
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
                        EditView(_text: "",
                                 _isShow: false,
                                 _image: UIImage(imageLiteralResourceName: "Camera"),
                                 _date: Date())
                    })
                }
                Spacer()
                ScrollView {
                        ForEach(cookItems) {
                            item in
                            Button(action: {
                                model.image = item.image.toImage()
                                model.dateString = item.cookedAt
                                model.text = item.text
                                flag.toggle()
                            }) {
                                HomeViewItem(_image: item.image.toImage(),
                                             _dateString: item.cookedAt,
                                             _text: item.text
                                )
                            }
                            .sheet(isPresented: $flag,
                                   content: {
                                    EditView(_text: model.text,
                                             _isShow: false,
                                             _image: model.image,
                                             _date: Date(dateString: model.dateString)!
                                    )
                                   }
                            )
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
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
