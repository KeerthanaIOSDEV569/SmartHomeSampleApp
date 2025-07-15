//
//   DeviceListView.swift
//  SmartHomeApp
//
//  Created by Siddu Lakshmi Keerthana on 15/07/25.
//

import SwiftUI
import SwiftData

struct DeviceListView: View {
    @Query var devices: [Device]
    @Environment(\.modelContext) var context

    @State private var showDeleteAlert = false
    @State private var indexSetToDelete: IndexSet?

    var body: some View {
        NavigationStack {
            List {
                ForEach(devices) { device in
                    DeviceRowView(device: device)
                }
                .onDelete { offsets in
                    indexSetToDelete = offsets
                    showDeleteAlert = true
                }
            }
            .navigationTitle("Smart Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Add", destination: AddDeviceView())
                }
            }
        }
        .alert("Are you sure you want to delete this device?",
               isPresented: $showDeleteAlert,
               presenting: indexSetToDelete) { offsets in
            Button("Delete", role: .destructive) {
                deleteDevices(at: offsets)
            }
            Button("Cancel", role: .cancel) { }
        } message: { _ in
            Text("This action cannot be undone.")
        }
    }

    func deleteDevices(at offsets: IndexSet) {
        for index in offsets {
            context.delete(devices[index])
        }
        do {
            try context.save()
        } catch {
            print("❌ Failed to delete: \(error)")
        }
    }
}
