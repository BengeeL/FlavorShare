//
//  TimestampExtension.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-20.
//

import Firebase

extension Timestamp {
    func timestampString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .short
        return formatter.string(from: self.dateValue(), to: Date()) ?? ""
    }
}
