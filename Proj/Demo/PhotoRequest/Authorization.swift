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
    
    case restricted
    case denied
}

public enum AuthorizedResult {
    
    case success
    case error(AuthorizedErrorType)
}

public typealias AuthorizedCompletion = ((AuthorizedResult) -> Void)

public final class Authorization {
    
    fileprivate init() {}
    
    public static func camera(_ completion: AuthorizedCompletion?) {
        let status = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
        switch status {
        case .authorized:
            completion?(AuthorizedResult.success)
        case .restricted:
            completion?(AuthorizedResult.error(.restricted))
        case .denied:
            completion?(AuthorizedResult.error(.denied))
        case .notDetermined:
            AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo) { granted in
                DispatchQueue.main.async {
                    if granted {
                        completion?(AuthorizedResult.success)
                    } else {
                        completion?(AuthorizedResult.error(.denied))
                    }
                }
            }
        }
    }
    
    public static func photo(_ completion: AuthorizedCompletion?) {
        switch PHPhotoLibrary.authorizationStatus() {
        case .authorized:
            completion?(AuthorizedResult.success)
        case .restricted:
            completion?(AuthorizedResult.error(.restricted))
        case .denied:
            completion?(AuthorizedResult.error(.denied))
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization() { status in
                DispatchQueue.main.async {
                    if status == PHAuthorizationStatus.authorized {
                        completion?(AuthorizedResult.success)
                    } else {
                        completion?(AuthorizedResult.error(.denied))
                    }
                }
            }
        }
    }
}
