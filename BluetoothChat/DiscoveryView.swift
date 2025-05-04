//
//  ContentView.swift
//  BluetoothChat
//
//  Created by Scott Recker on 5/2/25.
//

import SwiftUI
import CoreBluetooth

struct DiscoveryView: View {

    var body: some View {
        VStack(alignment: .leading) {
            Text("Scanning ...")
            Text("Peripherals found: xxxx")
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .navigationTitle("Basic Chat")
    }
}

#Preview {
    NavigationStack {
        DiscoveryView()
    }
}
