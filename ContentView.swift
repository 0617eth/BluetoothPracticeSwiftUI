//
//  ContentView.swift
//  BluetoothPracticeSwiftUIGithub
//

import SwiftUI

struct ContentView: View
{
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                Spacer()
                
                NavigationLink("Central Mode")
                {
                    //CentralView(bluetoothCentral: bluetoothCentral)
                    CentralView()
                }
                
                Spacer()
                
                NavigationLink("Peripheral Mode")
                {
                    //PeripheralView(bluetoothPeripheral: bluetoothPeripheral)
                    PeripheralView()
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
