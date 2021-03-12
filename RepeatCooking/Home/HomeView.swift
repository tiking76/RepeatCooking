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
    @FetchRequest(fetchRequest: CookItem.getAllMemoItems()) var cookItems: FetchedResults<CookItem>
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
                ForEach(0..<10) {
                    item in
                    HomeViewItem()
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
