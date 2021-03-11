//
//  Date.swift
//  RepeatCooking
//
//  Created by tiking on 2021/03/11.
//

import Foundation

private var formatter: DateFormatter {
    let _format = DateFormatter()
    _format.dateStyle = .medium
    _format.timeStyle = .none
    _format.dateFormat = "yyyy/MM/dd"
    return _format
}

extension Date {
    var string: String{
        return formatter.string(from: self)
    }
    
    init?(dateString: String, dateFormat: String = "yyyy/MM/dd") {
            formatter.dateFormat = dateFormat
            guard let date = formatter.date(from: dateString) else { return nil }
            self = date
        }
}
