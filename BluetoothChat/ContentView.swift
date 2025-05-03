//
//  ContentView.swift
//  BluetoothChat
//
//  Created by Scott Recker on 5/2/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
