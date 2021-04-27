//
//  DateFormatter+Extras.swift
//  CoreDataJournal
//
//  Created by Myles Cashwell on 4/26/21.
//

import Foundation

extension DateFormatter {
    static let entryTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
}

extension Date {
    func formatToString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        return formatter.string(from: self)
    }
}
