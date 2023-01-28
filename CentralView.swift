//
//  CentralView.swift
//  BluetoothPracticeSwiftUIGithub
//

import SwiftUI

struct CentralView: View
{
    @StateObject var bluetoothCentral = BluetoothCentral()
    
    @State var buttonText = "1"
    
    var body: some View
    {
        VStack
        {
            Text("Central")
            
            Text(bluetoothCentral.text ?? "nil")
            
            // This is just a test button.
            Button(buttonText)
            {
                buttonText = "2"
            }
        }
    }
}

struct CentralView_Previews: PreviewProvider
{
    static var previews: some View
    {
        CentralView()
    }
}
