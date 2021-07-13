//
//  AppDelegate.swift
//  RepeatCooking
//
//  Created by tiking on 2021/03/04.
//

import CoreData
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // NSPersistentContainerの取得
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "RepeatCooking")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError(error.localizedDescription)
            }
        })
        return container
    }()
    // データの保存メソッド
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                _ = error as NSError
                // 適宜エラー処理
                print(error.localizedDescription)
            }
        }
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
}
