//
//  DateFormatter.swift
//  WallE
//
//  Created by Esther on 1/23/23.
//

import Foundation

extension DateFormatter {
    
    static func string() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
    
}
