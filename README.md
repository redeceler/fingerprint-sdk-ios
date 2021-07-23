# IOS Cybersource Device Fingerprint
## IOS - Nativo 

### Getting started

1. Download the framework file. [download](https://drive.google.com/drive/folders/11RD6pt0zkMfnfmh6tYV3JCHLTNAKSX8s?usp=sharing)
2. Put the file in the root of your IOS project
3. Declare the frameworks on your `target -> General -> Frameworks, Library, and Embedded Content`
	- Click add other -> add files -> `select FingerPrintSDK.framework at the root of project`

### Usage
```javascript
// IMPORT THE FRAMEWORK
#import <FingerPrintSDK/FingerPrintSDK.h>

// GET SESSION ID ( Param: debug: YES or NOT)
NSString * sessionID = [FingerPrint getSessionId:true];

```
