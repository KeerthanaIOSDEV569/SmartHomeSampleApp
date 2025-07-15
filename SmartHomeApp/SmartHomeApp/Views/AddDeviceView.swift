//
//  AddDeviceView.swift
//  SmartHomeApp
//
//  Created by Siddu Lakshmi Keerthana on 15/07/25.
//

import SwiftUI

struct AddDeviceView: View {
    @Environment(\.modelContext) var context
    @StateObject var viewModel = DeviceViewModel()
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Form {
            TextField("Device Name", text: $viewModel.name)

            Picker("Device Type", selection: $viewModel.selectedType) {
                ForEach(DeviceType.allCases, id: \.self) { type in
                    Text(type.displayName).tag(type)
                }
            }

            Button("Add Device") {
                viewModel.addDevice(context: context)
                dismiss() 
            }
            .disabled(viewModel.name.isEmpty)
        }
        .navigationTitle("Add Device")
    }
}
