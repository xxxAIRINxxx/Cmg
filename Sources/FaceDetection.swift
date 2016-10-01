//
//  FaceDetection.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/24.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

public enum Accuracy {
    case low
    case high
    
    var options: [String : AnyObject] {
        switch self {
        case .low:
            return [CIDetectorAccuracy: CIDetectorAccuracyLow as AnyObject]
        case .high:
            return [CIDetectorAccuracy: CIDetectorAccuracyHigh as AnyObject]
        }
    }
}

public enum Option {
    case smile
    case eyeBlink
    
    var options: [String : AnyObject] {
        switch self {
        case .smile:
            return [CIDetectorSmile: true as AnyObject]
        case .eyeBlink:
            return [CIDetectorEyeBlink: true as AnyObject]
        }
    }
}

public struct FaceDetection {
    
    public let accuracy: Accuracy
    
    public init(accuracy: Accuracy = .high) {
        self.accuracy = accuracy
        
//        let options: [String : AnyObject] = [CIDetectorSmile: true, CIDetectorEyeBlink: true]
//        let detector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: [CIDetectorAccuracy: CIDetectorAccuracyLow])
    }
    
    public func processing(_ uiImage: UIImage) -> [CIFaceFeature] {
        guard let ciImage = CIImage.generate(uiImage) else { return [] }
        
        let detector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: self.accuracy.options)
        return detector!.features(in: ciImage, options: [:]).flatMap() { $0 as? CIFaceFeature }
    }
    
    public func detectionOfFaceBounds(_ image: UIImage) -> [CGRect] {
        let features = self.processing(image)
        
        return features.map() {
            var faceRect = $0.bounds
            faceRect.origin.y = image.size.height - faceRect.origin.y - faceRect.size.height
            return faceRect
        }
    }
}
