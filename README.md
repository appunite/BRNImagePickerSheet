# BRNImagePickerSheet

## About
BRNImagePickerSheet is a duplicate of that shiny new custom action sheet seen in iOS8's iMessage that Apple didn't make part of UIKit. It's the first project I've written in Swift. It works well but I might have coded something the Objective-C kind of way. Don't hesitate to open an issue/ pullrequest if you spotted something.

![BackgroundImage](https://raw.github.com/larcus94/BRNImagePickerSheet/master/Screenshots/BRNImagePickerSheet-about.png) 
![BackgroundImage](https://raw.github.com/larcus94/BRNImagePickerSheet/master/Screenshots/BRNImagePickerSheet-about-selected.png)

## Author
I'm Laurin Brandner, I'm on [Twitter](https://twitter.com/larcus94).

## Usage
BRNImagePickerSheet's API is similar to the one of UIActionSheet so you should get along with it just well.

### Example

```swift
let placeholder = BRNImagePickerSheet.selectedPhotoCountPlaceholder
var sheet = BRNImagePickerSheet()
sheet.addButtonWithTitle("Take Photo Or Video", singularSecondaryTitle: "Add Comment", pluralSecondaryTitle: nil)
sheet.addButtonWithTitle("Photo Library", singularSecondaryTitle: "Send \(placeholder) Photo", pluralSecondaryTitle: "Send \(placeholder) Photos")
sheet.delegate = self
sheet.showInView(self.view)
```

Note that you can use the placeholder to specify where BRNImagePickerSheet should insert the number of selected photos. This allows you to use very custom titles

```swift
func imagePickerSheet(imagePickerSheet: BRNImagePickerSheet, willDismissWithButtonIndex buttonIndex: Int) {
    if buttonIndex != imagePickerSheet.cancelButtonIndex {
        if imagePickerSheet.showsSecondaryTitles {
            println(imagePickerSheet.selectedPhotos)
        }
    else {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = (buttonIndex == 2) ? .PhotoLibrary : .Camera
        self.presentViewController(controller, animated: true, completion: nil)
        }
    }
}
```

## Installation

BRNImagePickerSheet will be available via [CocoaPods](http://cocoapods.org). However there's an [issue](https://github.com/CocoaPods/CocoaPods/issues/2226) with Swift compatibility that caused the build to fail. I will release it as soon as possible though. 

<!---
BRNImagePickerSheet is available via [CocoaPods](http://cocoapods.org).

To install add the following line to your Podfile:

    pod 'BRNImagePickerSheet'

-->

(There is apparently an issue with Xcode6 and Swift static libs. Check out [this issue](https://github.com/CocoaPods/CocoaPods/issues/2226) for more. 

## Requirements
BRNImagePickerSheet is written in Swift. It therefore runs on iOS 7 and 8.

## License
BRNImagePickerSheet is licensed under the [MIT License](http://opensource.org/licenses/mit-license.php). 