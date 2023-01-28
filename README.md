# BluetoothPracticeSwiftUI

In this project, I am using the SwiftUI & CoreBluetooth frameworks to build an app that will allow two iPhones to send data to each via bluetooth.
One iPhone acts as the Central Manager (awaiting to receive data), and the other acts as the Peripheral Manager (the one sending the data).
This project is almost an exact replica of the one Apple has created, where they made the app using UIKit. You can find and download that project using the
following link: https://developer.apple.com/documentation/corebluetooth/transferring_data_between_bluetooth_low_energy_devices

My problem I am facing is once I connect the iPhones and send the data, if I perform any action on the device with the Central Manager like going back
a view or tapping a button, the app will crash and emit an error in the 'BluetoothPracticeSwiftUIGithubApp.swift' file on line 8 where it says '@main'.
The error that is produced says: "Thread 1: EXC_BREAKPOINT (code=1, subcode=0x1c1544b80)". This crash does not occur in Apple's UIKit version.

Before you start tackling this problem are some things to note:
1. Set the iOS deployment target to iOS 14
2. In info.plist add 'Privacy - Bluetooth Always Usage Description' then choose an appropiate description

This is all I can think of right now as I'm a bit tired. There may be more I need to mention but this should be enough. Send me a message if you have
any questions! I'll update this README file if things come to mind that I think I need to share.
