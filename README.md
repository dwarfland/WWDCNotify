# WWDCNotify

A sample Oxygene + RemObjects SDK app to show how to use Apple Push Notifications to get notified of the WWDC webpage changing.

The server is implanted in .NET/Mono, the client as pure native iOS Cocoa app; both written in Oxygene.

Requires the latest Oxygene "Nougat" beta, and RemObjects SDK for .NET and for Cocoa.

Enjoy, and hope to see you at WW!

Oh: only file missing from the commit is my WWDCNotifyServer.p12 certificate. You will need to create your own Push Certificate.

Oh2: and change the hardcoded server URL, in AppDelegate.pas. If i get mored, i might fancy this up more, later.