//
//  Device.swift
//  SmartHomeApp
//
//  Created by Siddu Lakshmi Keerthana on 15/07/25.
//

import Foundation
import SwiftData

@Model
class Device: Identifiable {
    var id: UUID
    var name: String
    var type: DeviceType
    var isOn: Bool
    var value: Int?

    init(name: String, type: DeviceType, isOn: Bool = false, value: Int? = nil) {
        self.id = UUID()
        self.name = name
        self.type = type
        self.isOn = isOn
        self.value = value
    }
}
