//
//  DeviceType.swift
//  SmartHomeApp
//
//  Created by Siddu Lakshmi Keerthana on 15/07/25.
//

import Foundation

enum DeviceType: String, Codable, CaseIterable {
    case light, fan, ac, door, motor

    var displayName: String {
        switch self {
        case .light: return "Light"
        case .fan: return "Fan"
        case .ac: return "AC"
        case .door: return "Door Lock"
        case .motor: return "Water Motor"
        }
    }
}
