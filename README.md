![logo](http://www.mintcode.org/images/mintkit.png)

MintKit
=======

MintKis is a simple fundemental iOS coding utils package based Objective-C, For only convenience on coding. It help you don't bother about fundemental functions or implementing simple functions.
* Handling NSString
* Add Shadow, border .. etc layers with One line code
* Move, Resize UIView very easy One line code
* Automatic Check NSString is null and Put TextFieldText, UIButtonTitle.
* Etc... Better Tools for iOS Developers.


#### Example of codebase down.
Before Code)
```objective-c
CGRect frame = self.ui_textField.frame;
frame.x += 320;
self.ui_textField.frame = frame;
```
MintKit Code)
```objective-c
[UIViewFrameUtil move:self.ui_textField moreX:320];
```

#### Contribute 
It's now basic and immature. So, It need other's contributions.
For make adding new fuction or modification better performance.. etc,
Commit frankly! Thank you.
**Welcome Together Coding Anyone!**

This Project in mintcode.org

<http://www.mintcode.org>


How To Get Started
====

###Only Use Compiled Library
Just copy Files on Release folder and Link Your project!

**There is Sample Project for Installing. Check `mintKitSample.xcodeproj` on WorkSpace or '/Sample'**

1. [Download](https://github.com/soleaf/MintKit/archive/master.zip) or [Clone](github-mac://openRepo/https://github.com/soleaf/MintKit) to any directory.
2. Copy folder `/Release/MintKit` into your project folder.
3. Open your project
4. Project Setting > Target > Build Phases> `Link Binary With Libraries`> Add 'libMintKit-Aggregate.a' in your project directory
5. … > Build Setting > search `Header Search Paths`  and Add `"$(SRCROOT)/Lib/MintKit/Headers"` *('Lib' is my location. If You use other location for MintKit, change it.)*
6. Use It! with import headers `MintKit/[header]`

```objective-c
#import <MintKit/mintKit.h>
(...)
[mintKit hello];
```
> **Reference Document** [Wiki](https://github.com/soleaf/MintKit/wiki)

###Compile and Use

1. [Download](https://github.com/soleaf/MintKit/archive/master.zip) or [Clone](github-mac://openRepo/https://github.com/soleaf/MintKit) to any directory.
2. Open MintKit Project in Xcode.
3. Build
    * Build 'Library-Simulator' > iPhone simulator
    * Build 'Library-Device' > iOS Device
    * Build 'Library-Aggregate' > iOS Device
4. Copy to Your Project folder
    * Copy folder `/Release/MintKit` into your project folder.
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

> **Reference Document** [Wiki](https://github.com/soleaf/MintKit/wiki)

Library Summary
===
*Will update soon for detail method informations.*
```
IF YOU WANT DETAIL HOW TO USE METHODS, CHECK `ANY HEADER FILES` AND `REFERENCE`
```
> **REFERENCE** [HERE](https://github.com/soleaf/MintKit/wiki)

Requirement
===
* ARC
* Frameworks
   * <b>QuartzCore.framework<b/>
   * UIkit.framework
   * CoreGraphics.framework

Credits
===
mintcode.org.
<milk@mintcode.org>
