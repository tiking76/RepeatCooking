//
//  Data+Image.swift
//  RepeatCooking
//
//  Created by tiking on 2021/03/12.
//

import Foundation
import UIKit

/// Data拡張(イメージ)
public extension Data {

    // MARK: Public Methods

    /// データ→イメージに変換する
    ///
    /// - Returns: 変換後のイメージ
    func toImage() -> UIImage {
        guard let image = UIImage(data: self) else {
            print("データをイメージに変換できませんでした。")
            return UIImage()
        }

        return image
    }

}
