MintKit
=======

MintKis is simple iOS coding utils package based Objective-C, For only convenience on coding.
* Handling NSString
* Add Shadow, border .. etc layers with One line code
* Move, Resize UIView very easy One line code
* Automatic Check NSString is null and Put TextFieldText, UIButtonTitle.
* Etc... Better Tools for iOS Developers.

It's now basic and immature. So, It need other's contributions.
For make adding new fuction or modification better performance.. etc,
Commit frankly! Thank you.
**Welcome Togeher Coding Anyone!**

This Project in mintcode.org

<http://www.mintcode.org>


How To Get Started
====

###Only Use Compiled Library
Just copy Files on Release folder and Link Your project!

**There is Sample Project for Installing. Check `mintKitSample.xcodeproj` on WorkSpace or '/Sample'**

1. [Download](https://github.com/soleaf/MintKit/archive/master.zip) or [Clone](github-mac://openRepo/https://github.com/soleaf/MintKit) to any directory.
2. Copy `mintKit/Release/libMintKit.a`, `headers` to your project folder.
3. Open your project
4. Project Setting > Target > Build Phases> `Link Binary With Libraries`> Add 'libMintKit-Aggregate.a' in your project directory
5. … > Build Setting > search `Header Search Paths`  and Add `"$(SRCROOT)/Lib/MintKit/Headers"` *('Lib' is my location. If You use other location for MintKit, change it.)*
6. Use It! with import headers `MintKit/[header]`

```objective-c
#import <MintKit/mintKit.h>
(...)
[mintKit hello];
```

###Compile and Use

1. [Download](https://github.com/soleaf/MintKit/archive/master.zip) or [Clone](github-mac://openRepo/https://github.com/soleaf/MintKit) to any directory.
2. Open MintKit Project in Xcode.
3. Build
    * Build 'Library-Simulator' > iPhone simulator
    * Build 'Library-Device' > iOS Device
    * Build 'Library-Aggregate' > iOS Device
4. Copy to Your Project folder
    * Click right `Product > ibmint-device.a` in project navigator(CMD+1)  and Show in finder
    * Copy `libMintKit-Aggregate.a` and `headers` on your project directory
5. Link Library
    * Open your project
    * Project Setting > Target > Build Phases> `Link Binary With Libraries`> Add 'libMintKit-Aggregate.a' on your project directory
    *  … > Build Setting > search `Header Search Paths`  and Add `"$(SRCROOT)/Lib/MintKit/Headers"` *('Lib' is my location. If You use other location for MintKit, change it.)*
6. Use It! with import headers `MintKit/[header]`

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

###Test
####TestKit.h
TestKit is help loging and debuging your application.
    Debuging log should separated by unrecognized 'nslog'. In this case, Use 'debug:' method.
    In Object Oriend Programing, Some methods that checking implement method could be used.

###Objects
####ObjectUtil.h
ObjectUtil supply some object tools.
These methods could be moved info other class.

####ArrayUtil.h
NSArray Utilities

####FormatUtil.h
Make String be foramtted like phone number.

####DateUtil.h
For easy using Date calculation.

####DateTimeSet.h
Model Object For Date and time.
 
###Map
####MapUtil.h
MKMapKit assistance.

###Graphics
####GraphicUtil.h
Graphic Utilities like reszing image.

####Animation.h
Animation Effect by One line Code.

###Validation
####FromValidation.h
Checking value is valid from.

###UI
####UIViewFrameUtil.h
UIViewFrameUtil make coding to modify UIView frame very easy.
 
####UIRobot.h
Automatic UI configurations.
Example. SetText on UITextField, If text is not nil.

####UILayerUtil.h
Make UIView Layer by One line code.
For drop shadow, gradient, etc...

####UIViewControllerUtil.h
UIViewController's helper
Make customed image back button in navigation bar,
Simple Alert ...

###ETC
####DeviceUtil.h
Some Informations for device
Checking Retina device, iPhone5...

Requirement
===
* ARC

Credits
===
mintcode.org.
<milk@mintcode.org>
