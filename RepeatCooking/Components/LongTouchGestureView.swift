//
//  LongTouchGestureView.swift
//  RepeatCooking
//
//  Created by tiking on 2021/03/26.
//

import SwiftUI

struct LongTouchGestureView: UIViewRepresentable {

    let longTap: (() -> Void)

    func makeUIView(context: UIViewRepresentableContext<LongTouchGestureView>) -> some UIView {
        let view = UIView(frame: .zero)
        let gesture = UILongPressGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.action))
        gesture.delegate = context.coordinator
        gesture.cancelsTouchesInView = false
        view.addGestureRecognizer(gesture)
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    func makeCoordinator() -> Coordinator {
        Coordinator(callback: longTap)
    }

    class Coordinator: NSObject {
        let callback: () -> Void
        init(callback: @escaping () -> Void) {
            self.callback = callback
        }
        @objc func action(_ sender: UIPanGestureRecognizer) {
            if sender.state == .began {
                callback()
            }
        }
    }
}

extension LongTouchGestureView.Coordinator: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        true
    }
}
