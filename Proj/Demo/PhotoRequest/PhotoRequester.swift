//
//  PhotoRequester.swift
//  PhotoRequest
//
//  Created by xxxAIRINxxx on 2016/04/17.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit

public enum PhotoResquestResult {
    case Success(image: UIImage)
    case Faild
    case Cancel
    
    var image: UIImage? {
        if case .Success(let image) = self { return image }
        return nil
    }
}

public typealias PhotoResquestCompletion = (PhotoResquestResult -> Void)

public final class PhotoRequester: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private static let shared : PhotoRequester = PhotoRequester()
    
    private var completionHandler : (PhotoResquestCompletion)?
    
    public static func showActionSheet(parentViewController: UIViewController, completion: PhotoResquestCompletion?) {
        ActionSheet(title: "Select SourceType", message: "")
            .addAction("PhotoLibrary") {
                PhotoRequester.requestPhotoLibrary(parentViewController, completion: completion)
            }
            .addAction("Camera") {
                PhotoRequester.requestPhotoFromCamera(parentViewController, completion: completion)
            }
            .addAction("SavedPhotosAlbum") {
                PhotoRequester.requestPhotoFromSavedPhotosAlbum(parentViewController, completion: completion)
            }
            .setCancelAction("Cancel") { }
            .show(parentViewController)
    }
    
    public static func requestPhotoLibrary(parentViewController: UIViewController, completion: PhotoResquestCompletion?) {
        self.shared.requestPhoto(parentViewController, .PhotoLibrary, completion)
    }
    
    public static func requestPhotoFromCamera(parentViewController: UIViewController, completion: PhotoResquestCompletion?) {
        self.shared.requestPhoto(parentViewController, .Camera, completion)
    }
    
    public static func requestPhotoFromSavedPhotosAlbum(parentViewController: UIViewController, completion: PhotoResquestCompletion?) {
        self.shared.requestPhoto(parentViewController, .SavedPhotosAlbum, completion)
    }
    
    private func requestPhoto(parentViewController: UIViewController, _ sourceType: UIImagePickerControllerSourceType , _ completion: PhotoResquestCompletion?) {
        
        if !UIImagePickerController.isSourceTypeAvailable(sourceType) {
            completion?(PhotoResquestResult.Faild)
            return
        }
        
        let resultBlock: AuthorizedCompletion = { [unowned self] result in
            switch result {
            case .Success:
                let imagePickerController : UIImagePickerController = UIImagePickerController()
                imagePickerController.sourceType = sourceType
                imagePickerController.allowsEditing = false
                imagePickerController.delegate = self
                
                self.completionHandler = completion
                
                parentViewController.presentViewController(imagePickerController, animated: true, completion: nil)
            case .Error(_):
                completion?(PhotoResquestResult.Faild)
            }
        }
        
        switch sourceType {
        case .Camera:
            Authorization.camera(resultBlock)
        case .PhotoLibrary, .SavedPhotosAlbum:
            Authorization.photo(resultBlock)
        }
    }
}

// MARK: - UIImagePickerControllerDelegate

extension PhotoRequester {
    
    public func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        picker.dismissViewControllerAnimated(true) { [unowned self] in
            self.completionHandler?(PhotoResquestResult.Success(image: image))
            self.completionHandler = nil
        }
    }
    
    public func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true) { [unowned self] in
            self.completionHandler?(PhotoResquestResult.Cancel)
            self.completionHandler = nil
        }
    }
}
