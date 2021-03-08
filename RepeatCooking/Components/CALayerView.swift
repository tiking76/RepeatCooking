//
//  Camera.swift
//  RepeatCooking
//
//  Created by tiking on 2021/03/08.
//

import SwiftUI

//UIViewRepresentableにするとframe(width: 0 ,height:0)になり表示されなくなる
struct CALayerView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    var caLayer: CALayer
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        viewController.view.layer.addSublayer(caLayer)
        caLayer.frame = viewController.view.layer.frame
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        caLayer.frame = uiViewController.view.layer.frame
    }
}
