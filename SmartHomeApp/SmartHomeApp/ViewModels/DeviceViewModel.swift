//
//  DeviceViewModel.swift
//  SmartHomeApp
//
//  Created by Siddu Lakshmi Keerthana on 15/07/25.
//

import SwiftUI
import SwiftData

class DeviceViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var selectedType: DeviceType = .light

    func addDevice(context: ModelContext) {
        let newDevice = Device(name: name, type: selectedType)
        context.insert(newDevice)
        try? context.save()
    }

    func togglePower(_ device: Device, context: ModelContext) {
        device.isOn.toggle()
        try? context.save()
    }

    func updateValue(_ device: Device, value: Int, context: ModelContext) {
        device.value = value
        try? context.save()
    }
}
