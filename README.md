MintKit
=======

MintKis is simple iOS coding utils package based Objective-C, for only convenience on coding.

It's now basic and immature. So, It need other's contributions.

For make adding new fuction or modification better performance.. etc, comit frankly! Thank you.

This Project in mintcode.org

<http://www.mintcode.org>


How To Get Started
====

1. Download MintKit any directory.
2. Open MintKit Project in Xcode.
3. Build 'Library-Simulator' > iPhone simulator
4. Build 'Library-Device' > iOS Device
5. Build 'Library-Aggregate' > iOS Device
6. Right click 'Product > ibmint-device.a' in project navigator(CMD+1) 
7. Show in finder
8. Copy 'libMintKit-Aggregate.a' and 'headers' on your project directory
9. Open your project
10. Project Setting > Target > Build Phases> Link Binary With Libraries> Add 'libMintKit-Aggregate.a' in your project directory
11. … > Build Setting > search 'Header Search Paths'  and Add '"$(SRCROOT)/Lib/MintKit/Headers"' ('Lib' is my location. If you use other location for MintKit, change it.)
12. Use It! with import, <MintKit/[header]>

```objective-c
#import <MintKit/mintKit.h>
(...)
[mintKit hello];
```

Library Summary
===
Will update soon...

Credits
===
Ahn il ho(soleaf) in iOS developer & UX designer of mintcode.org.

