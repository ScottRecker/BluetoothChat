//
//  ContentView.swift
//  BluetoothChat
//
//  Created by Scott Recker on 5/2/25.
//

import SwiftUI
import CoreBluetooth

struct DiscoveryView: View {
    @State private var viewModel = DiscoveryViewModel()
    @State private var selectedItem: CBPeripheral?

    var body: some View {
        NavigationStack() {
            VStack(alignment: .leading) {
                Text("Bluetooth Chat")
                    .font(.title)
                    .bold()
                    .padding(.bottom)
                Text("Scanning ...")
                Text("Peripherals found: \(viewModel.peripheralArray.count)")
                List(viewModel.peripheralArray, id: \.self) { device in
                    NavigationLink {
                        ConsoleView()
                    } label: {
                        HStack {
                            Text("\(device.name ?? "Unknown")")
                            Spacer()
                            Text("RSSI: \(viewModel.fetchRSSI(for: device) ?? "Unknown")")
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Scan") {
                    viewModel.startScanning()
                }
            }
        }
        .navigationTitle("Basic Chat")
    }
}

#Preview {
        DiscoveryView()
}
