//
//  CookItem.swift
//  RepeatCooking
//
//  Created by tiking on 2021/03/12.
//

import Foundation
import CoreData

public class CookItem: NSManagedObject, Identifiable {
    @NSManaged public var cookedAt: Date?
    @NSManaged public var text: String?
//    @NSManaged public var image: Data?
    
    static func getAllMemoItems() -> NSFetchRequest<CookItem> {
        let request: NSFetchRequest<CookItem> = NSFetchRequest<CookItem>(entityName: "CookItem")
        request.sortDescriptors = [NSSortDescriptor(key: "cookedAt", ascending: true)]
        return request
    }
}
