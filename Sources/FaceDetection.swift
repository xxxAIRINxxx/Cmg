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
    case Low
    case High
    
    var options: [String : AnyObject] {
        switch self {
        case .Low:
            return [CIDetectorAccuracy: CIDetectorAccuracyLow]
        case .High:
            return [CIDetectorAccuracy: CIDetectorAccuracyHigh]
        }
    }
}

public enum Option {
    case Smile
    case EyeBlink
    
    var options: [String : AnyObject] {
        switch self {
        case .Smile:
            return [CIDetectorSmile: true]
        case .EyeBlink:
            return [CIDetectorEyeBlink: true]
        }
    }
}

public struct FaceDetection {
    
    public let accuracy: Accuracy
    
    public init(accuracy: Accuracy = .High) {
        self.accuracy = accuracy
        
//        let options: [String : AnyObject] = [CIDetectorSmile: true, CIDetectorEyeBlink: true]
//        let detector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: [CIDetectorAccuracy: CIDetectorAccuracyLow])
    }
    
    public func processing(uiImage: UIImage) -> [CIFaceFeature] {
        guard let ciImage = CIImage.generate(uiImage) else { return [] }
        
        let detector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: self.accuracy.options)
        return detector.featuresInImage(ciImage, options: [:]).flatMap() { $0 as? CIFaceFeature }
    }
    
    public func detectionOfFaceBounds(image: UIImage) -> [CGRect] {
        let features = self.processing(image)
        
        return features.map() {
            var faceRect = $0.bounds
            faceRect.origin.y = image.size.height - faceRect.origin.y - faceRect.size.height
            return faceRect
        }
    }
}