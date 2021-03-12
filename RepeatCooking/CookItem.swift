//
//  CookItem.swift
//  RepeatCooking
//
//  Created by tiking on 2021/03/12.
//

import Foundation
import CoreData

public class RepeatCooking: NSManagedObject, Identifiable {
    @NSManaged public var cookedAt: String
    @NSManaged public var text: String
    @NSManaged public var image: Data
    
    static func getAllMemoItems() -> NSFetchRequest<RepeatCooking> {
        let request: NSFetchRequest<RepeatCooking> = RepeatCooking.fetchRequest() as! NSFetchRequest<RepeatCooking>
        request.sortDescriptors = [NSSortDescriptor(key: "cookedAt", ascending: true)]
        return request
    }
}
