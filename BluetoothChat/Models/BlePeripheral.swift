//
//  BlePeripheral.swift
//  BluetoothChat
//
//  Created by Scott Recker on 5/4/25.
//


import CoreBluetooth

class BtPeripheral {
    static var connectedPeripheral: CBPeripheral?
    static var connectedService: CBService?
    static var connectedTXChar: CBCharacteristic?
    static var connectedRXChar: CBCharacteristic?
}
