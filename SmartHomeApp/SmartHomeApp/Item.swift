//
//  Item.swift
//  SmartHomeApp
//
//  Created by Siddu Lakshmi Keerthana on 15/07/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
