//
//  ViewController.swift
//  BRNImagePickerSheet
//
//  Created by Laurin Brandner on 04/09/14.
//  Copyright (c) 2014 Laurin Brandner. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BRNImagePickerSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: "presentImagePickerSheet:")
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    // MARK: Other Methods
    
    func presentImagePickerSheet(gestureRecognizer: UITapGestureRecognizer) {
        let placeholder = BRNImagePickerSheet.selectedPhotoCountPlaceholder
        
        var sheet = BRNImagePickerSheet()
        sheet.addButtonWithTitle("Take Photo Or Video", singularSecondaryTitle: "Add Comment", pluralSecondaryTitle: nil)
        sheet.addButtonWithTitle("Photo Library", singularSecondaryTitle: "Send \(placeholder) Photo", pluralSecondaryTitle: "Send \(placeholder) Photos")
        sheet.delegate = self
        sheet.showInView(self.view)
    }
    
    // MARK: BRNImagePickerSheetDelegate
    
    func imagePickerSheet(imagePickerSheet: BRNImagePickerSheet, willDismissWithButtonIndex buttonIndex: Int) {
        if buttonIndex != imagePickerSheet.cancelButtonIndex {
            if imagePickerSheet.showsSecondaryTitles {
                println(imagePickerSheet.selectedPhotos)
                imagePickerSheet.photoURLsForSelectedImages()
            }
            else {
                let controller = UIImagePickerController()
                controller.delegate = self
                var sourceType: UIImagePickerControllerSourceType = (buttonIndex == 2) ? .PhotoLibrary : .Camera
                if (!UIImagePickerController.isSourceTypeAvailable(sourceType)) {
                    sourceType = .PhotoLibrary
                    println("Fallback to camera roll as a source since the simulator doesn't support taking pictures")
                }
                controller.sourceType = sourceType
                
                self.presentViewController(controller, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
