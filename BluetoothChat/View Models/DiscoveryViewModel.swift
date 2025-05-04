//
//  DiscoveryViewModel.swift
//  BluetoothChat
//
//  Created by Scott Recker on 5/4/25.
//

import CoreBluetooth
import SwiftUI

@Observable
class DiscoveryViewModel: NSObject {
    var isBluetoothEnabled: Bool = false
    var peripheralArray: [CBPeripheral] = []

    private var centralManager: CBCentralManager!
    private var rssiArray = [NSNumber]()
    private var timer = Timer()
    private var bluefruitPeripheral: CBPeripheral!

    override init() {
        super.init()
        self.centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    func startScanning() -> Void {
        // Remove prior data
        peripheralArray.removeAll()
        rssiArray.removeAll()
        // Start Scanning
        centralManager?.scanForPeripherals(withServices: [CBUUIDs.BLEService_UUID])
        Timer.scheduledTimer(withTimeInterval: 15, repeats: false) {_ in
            self.stopScanning()
        }
    }

    func stopScanning() -> Void {
        centralManager?.stopScan()
    }

    func fetchRSSI(for peripheral: CBPeripheral) -> String? {
        guard let index = peripheralArray.firstIndex(of: peripheral) else { return nil }
        return rssiArray[index].stringValue
    }
}

extension DiscoveryViewModel: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOff:
            print("Is Powered Off.")
        case .poweredOn:
            print("Is Powered On.")
            startScanning()
        case .unsupported:
            print("Is Unsupported.")
        case .unauthorized:
            print("Is Unauthorized.")
        case .unknown:
            print("Unknown")
        case .resetting:
            print("Resetting")
        @unknown default:
            print("Error")
        }
    }

    func centralManager( _ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber ) {

        bluefruitPeripheral = peripheral

        if peripheralArray.contains(peripheral) {
            print("Duplicate Found.")
        } else {
            peripheralArray.append(peripheral)
            rssiArray.append(RSSI)
        }

        print("Peripheral Discovered: \(peripheral)")
    }

    // MARK: - Connect
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        stopScanning()
        bluefruitPeripheral.discoverServices([CBUUIDs.BLEService_UUID])
    }
}
