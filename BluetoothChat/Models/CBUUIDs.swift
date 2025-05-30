//
//  CBUUIDs.swift
//  BluetoothChat
//
//  Created by Scott Recker on 5/4/25.
//


import CoreBluetooth

struct CBUUIDs{
    // Nordic UART Service
    private static let kBLEService_UUID = "6e400001-b5a3-f393-e0a9-e50e24dcca9e"
    private static let kBLE_Characteristic_uuid_Tx = "6e400002-b5a3-f393-e0a9-e50e24dcca9e"
    private static let kBLE_Characteristic_uuid_Rx = "6e400003-b5a3-f393-e0a9-e50e24dcca9e"

    static let BLEService_UUID = CBUUID(string: kBLEService_UUID)
    static let BLE_Characteristic_uuid_Tx = CBUUID(string: kBLE_Characteristic_uuid_Tx)//(Property = Write without response)
    static let BLE_Characteristic_uuid_Rx = CBUUID(string: kBLE_Characteristic_uuid_Rx)// (Property = Read/Notify)
}
