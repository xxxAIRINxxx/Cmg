//
//  Enhancement.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

public struct AutoAdjustEnhance: Processable {
    
    public var name: String = "AutoAdjustEnhance"
    
    public init() {}
    
    public func processing(ciImage: CIImage?) -> CIImage? {
        guard let _ciImage = ciImage else { return nil }
        
        let filters = _ciImage.autoAdjustmentFiltersWithOptions([kCIImageAutoAdjustEnhance : true, kCIImageAutoAdjustRedEye : false])
        
        let outputImage = filters.reduce(_ciImage) {
            $0.1.setValue($0.0, forKey: kCIInputImageKey)
            return $0.1.outputImage!
        }
        
        return outputImage
    }
}

public struct AutoAdjustRedEye: Processable {
    
    public var name: String = "AutoAdjustRedEye"
    
    public init() {}
    
    public func processing(ciImage: CIImage?) -> CIImage? {
        guard let _ciImage = ciImage else { return nil }
        
        let filters = _ciImage.autoAdjustmentFiltersWithOptions([kCIImageAutoAdjustEnhance : false, kCIImageAutoAdjustRedEye : true])
        
        let outputImage = filters.reduce(_ciImage) {
            $0.1.setValue($0.0, forKey: kCIInputImageKey)
            return $0.1.outputImage!
        }
        
        return outputImage
    }
}
