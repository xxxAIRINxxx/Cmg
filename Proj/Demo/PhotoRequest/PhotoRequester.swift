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
    case success(image: UIImage)
    case faild
    case cancel
    
    var image: UIImage? {
        if case .success(let image) = self { return image }
        return nil
    }
}

public typealias PhotoResquestCompletion = ((PhotoResquestResult) -> Void)

public final class PhotoRequester: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    fileprivate static let shared : PhotoRequester = PhotoRequester()
    
    fileprivate var completionHandler : (PhotoResquestCompletion)?
    
    public static func showActionSheet(_ parentViewController: UIViewController, completion: PhotoResquestCompletion?) {
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
    
    public static func requestPhotoLibrary(_ parentViewController: UIViewController, completion: PhotoResquestCompletion?) {
        self.shared.requestPhoto(parentViewController, .photoLibrary, completion)
    }
    
    public static func requestPhotoFromCamera(_ parentViewController: UIViewController, completion: PhotoResquestCompletion?) {
        self.shared.requestPhoto(parentViewController, .camera, completion)
    }
    
    public static func requestPhotoFromSavedPhotosAlbum(_ parentViewController: UIViewController, completion: PhotoResquestCompletion?) {
        self.shared.requestPhoto(parentViewController, .savedPhotosAlbum, completion)
    }
    
    fileprivate func requestPhoto(_ parentViewController: UIViewController, _ sourceType: UIImagePickerController.SourceType , _ completion: PhotoResquestCompletion?) {
        
        if !UIImagePickerController.isSourceTypeAvailable(sourceType) {
            completion?(PhotoResquestResult.faild)
            return
        }
        
        let resultBlock: AuthorizedCompletion = { [unowned self] result in
            switch result {
            case .success:
                let imagePickerController : UIImagePickerController = UIImagePickerController()
                imagePickerController.sourceType = sourceType
                imagePickerController.allowsEditing = false
                imagePickerController.delegate = self
                
                self.completionHandler = completion
                
                parentViewController.present(imagePickerController, animated: true, completion: nil)
            case .error(_):
                completion?(PhotoResquestResult.faild)
            }
        }
        
        switch sourceType {
        case .camera:
            Authorization.camera(resultBlock)
        case .photoLibrary, .savedPhotosAlbum:
            Authorization.photo(resultBlock)
        }
    }
}

// MARK: - UIImagePickerControllerDelegate

extension PhotoRequester {
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        picker.dismiss(animated: true) { [unowned self] in
            self.completionHandler?(PhotoResquestResult.success(image: image))
            self.completionHandler = nil
        }
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true) { [unowned self] in
            self.completionHandler?(PhotoResquestResult.cancel)
            self.completionHandler = nil
        }
    }
}
