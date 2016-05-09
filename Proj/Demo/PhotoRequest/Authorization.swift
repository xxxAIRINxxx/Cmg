//
//  Authorization.swift
//  PhotoRequest
//
//  Created by xxxAIRINxxx on 2016/04/17.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import Photos

public enum AuthorizedErrorType {
    
    case Restricted
    case Denied
}

public enum AuthorizedResult {
    
    case Success
    case Error(AuthorizedErrorType)
}

public typealias AuthorizedCompletion = (AuthorizedResult -> Void)

public final class Authorization {
    
    private init() {}
    
    public static func camera(completion: AuthorizedCompletion?) {
        let status = AVCaptureDevice.authorizationStatusForMediaType(AVMediaTypeVideo)
        switch status {
        case .Authorized:
            completion?(AuthorizedResult.Success)
        case .Restricted:
            completion?(AuthorizedResult.Error(.Restricted))
        case .Denied:
            completion?(AuthorizedResult.Error(.Denied))
        case .NotDetermined:
            AVCaptureDevice.requestAccessForMediaType(AVMediaTypeVideo) { granted in
                dispatch_async(dispatch_get_main_queue()) {
                    if granted {
                        completion?(AuthorizedResult.Success)
                    } else {
                        completion?(AuthorizedResult.Error(.Denied))
                    }
                }
            }
        }
    }
    
    public static func photo(completion: AuthorizedCompletion?) {
        switch PHPhotoLibrary.authorizationStatus() {
        case .Authorized:
            completion?(AuthorizedResult.Success)
        case .Restricted:
            completion?(AuthorizedResult.Error(.Restricted))
        case .Denied:
            completion?(AuthorizedResult.Error(.Denied))
        case .NotDetermined:
            PHPhotoLibrary.requestAuthorization() { status in
                dispatch_async(dispatch_get_main_queue()) {
                    if status == PHAuthorizationStatus.Authorized {
                        completion?(AuthorizedResult.Success)
                    } else {
                        completion?(AuthorizedResult.Error(.Denied))
                    }
                }
            }
        }
    }
}