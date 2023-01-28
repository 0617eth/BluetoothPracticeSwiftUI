//
//  PeripheralView.swift
//  BluetoothPracticeSwiftUIGithub
//

import SwiftUI

struct PeripheralView: View
{
    @StateObject var bluetoothPeripheral = BluetoothPeripheral()
    
    var body: some View
    {
        VStack
        {
            Text("Peripheral")
            Text(bluetoothPeripheral.text ?? "nil")
            
            Spacer()
            
            HStack
            {
                Text("Advertising")
                Toggle("", isOn: $bluetoothPeripheral.advertisingToggleIsOn)
                    .disabled(!bluetoothPeripheral.advertisingToggleEnabled)
                    .onChange(of: bluetoothPeripheral.advertisingToggleIsOn)
                {newValue in
                    bluetoothPeripheral.toggleChanged()
                }
            }
            .padding()
        }
    }
}

struct PeripheralView_Previews: PreviewProvider
{
    static var previews: some View
    {
        PeripheralView()
    }
}
