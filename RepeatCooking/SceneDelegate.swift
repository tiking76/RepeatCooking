//
//  SceneDelegate.swift
//  RepeatCooking
//
//  Created by tiking on 2021/03/04.
//

import SwiftUI
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let contentView = ContentView().environment(\.managedObjectContext, managedObjectContext)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    func sceneDidEnterBackground(_ scene: UIScene) {
        // 保存処理
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}
