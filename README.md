MintKit
=======

MintKis is simple iOS coding utils package based Objective-C, for only convenience on coding.

It's now basic and immature. So, It need other's contributions.

For make adding new fuction or modification better performance.. etc, comit frankly! Thank you.

This Project in mintcode.org

<http://www.mintcode.org>


How To Get Started
====

###Only Use Compiled Library
1. Download MintKit any directory.
2. Copy `mintKit/Release/libMintKit.a`, `headers` to your project folder.
3. Open your project
4. Project Setting > Target > Build Phases> Link Binary With Libraries> Add 'libMintKit-Aggregate.a' in your project directory
5. … > Build Setting > search `Header Search Paths`  and Add `"$(SRCROOT)/Lib/MintKit/Headers"` ('Lib' is my location. If you use other location for MintKit, change it.)
6. Use It! with import headers `MintKit/[header]`

```objective-c
#import <MintKit/mintKit.h>
(...)
[mintKit hello];
```

###Compile and Use

1. Download MintKit any directory.
2. Open MintKit Project in Xcode.
3. Build 'Library-Simulator' > iPhone simulator
4. Build 'Library-Device' > iOS Device
5. Build 'Library-Aggregate' > iOS Device
6. Right click `Product > ibmint-device.a` in project navigator(CMD+1)  and Show in finder
7. Copy `libMintKit-Aggregate.a` and `headers` on your project directory
8. Open your project
9. Project Setting > Target > Build Phases> Link Binary With Libraries> Add 'libMintKit-Aggregate.a' in your project directory
10. … > Build Setting > search `Header Search Paths`  and Add `"$(SRCROOT)/Lib/MintKit/Headers"` ('Lib' is my location. If you use other location for MintKit, change it.)
11. Use It! with import headers `MintKit/[header]`

```objective-c
#import <MintKit/mintKit.h>
(...)
[mintKit hello];
```

Library Summary
===
*Will update soon for detail method informations.*

####mintKit.h
Information for mitKit


####Test/TestKit.h
TestKit is help loging and debuging your application.
    Debuging log should separated by unrecognized 'nslog'. In this case, Use 'debug:' method.
    In Object Oriend Programing, Some methods that checking implement method could be used.


####Objects/ObjectUtil.h
ObjectUtil supply some object tools.
These methods could be moved info other class.

####Objects/ArrayUtil.h
NSArray Utilities

####Objects/FormatUtil.h
Make String be foramtted like phone number.


####objects/DateUtil.h
For easy using Date calculation.

####objects/DateTimeSet.h
 Model Object For Date and time.
 
 
####Map/MapUtil.h
MKMapKit assistance.

####Graphics/GraphicUtil.h
Graphic Utilities like reszing image.

####Validation/FromValidation.h
Checking value is valid from.

####UI/UIViewFrameUtil.h
UIViewFrameUtil make coding to modify UIView frame very easy.
 
####UI/UIRobot.h
Automatic UI configurations.
Example. SetText on UITextField, If text is not nil.

####UI/UILayerUtil.h
Make UIView Layer by One line code.
For drop shadow, gradient, etc...

####UI/UIViewControllerUtil.h
UIViewController's helper
Make customed image back button in navigation bar,
Simple Alert ...

####ETC/DeviceUtil.h
Some Informations for device
Checking Retina device, iPhone5...

Credits
===
mintcode.org.

