//
//   DeviceRowView..swift
//  SmartHomeApp
//
//  Created by Siddu Lakshmi Keerthana on 15/07/25.
//

import SwiftUI

struct DeviceRowView: View {
    @Bindable var device: Device

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(device.name)
                    .font(.headline)
                Spacer()
                Text(device.type.displayName)
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            switch device.type {
            case .light, .motor, .door:
                Toggle("Power", isOn: $device.isOn)
            case .fan:
                VStack {
                    Slider(value: Binding(get: {
                        Double(device.value ?? 0)
                    }, set: {
                        device.value = Int($0)
                    }), in: 0...5, step: 1)
                    Text("Fan Speed: \(device.value ?? 0)")
                }
            case .ac:
                Stepper("Temperature: \(device.value ?? 24)°C", value: Binding(get: {
                    device.value ?? 24
                }, set: {
                    device.value = $0
                }), in: 16...30)
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.gray.opacity(0.1)))
    }
}
