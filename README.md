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


EDIT: 02/13/23

I've learned that going back a view or tapping a button is actually unreachable. Just simply touching the screen on the Central Manager will cause the app to crash on that device. I have also been in contact with an Apple Developer Technician, and one thing they mentioned to me was this:

"Aside from some points in your code that could well be causing a crash (use of force unwraps is always risky), the main issue here is the use of CoreBluetooth within a SwiftUI app.

The CoreBluetooth framework does not directly support SwiftUI, and works on a delegate callback structure like in a UIKit app. So, the proper way of implementing CoreBluetooh in a SwiftUI app is by the use of @UIApplicationDelegateAdaptor and implementing CoreBluetooth functionality in this delegate class.
We have a sample of how CoreBluetooth is used in a SwiftUI project: https://developer.apple.com/documentation/watchkit/interacting_with_bluetooth_peripherals_during_background_app_refresh
This is somewhat similar to the sample you are working with, with some differences. It sends data from the phone app to the watch app. The implementation of CoreBluetooth on watchOS is somewhat different than iOS (there are limitations), so you can ignore that for now unless you are also interested in creating a watch app.
In this project, you will see several targets, and you would want to look at the BARBluetooth target, which is a simple SwiftUI app that advertises and sends some data to the receiving app.
You can use that as a template to learn how to implement your own app in SwiftUI.
Note how the ApplicationDelegate is defined in SamplePeripheralApp.swift
And ApplicationDelegate.swift kicks off the UIKit application lifecycle which CoreBluetooth will run in."

Now I have tried using @UIApplicationDelegateAdaptor and it did not work. Although I am not really familiar with it, so it's possible I used it wrong. Take a look at the project this technician sent me and try implementing @UIApplicationDelegateAdaptor to see if it works for you.

Another thing I noticed, in the log for the central manager when the app crashes is the following message: "malloc: can't allocate region
:*** mach_vm_map(size=580964351930810368, flags: 100) failed (error code=3)"

Apparently this means I'm trying to access 580 million GB of memory? Not sure how that would happen, but I will continue to investigate.
