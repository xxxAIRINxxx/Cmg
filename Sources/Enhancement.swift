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
    
    public func processing(_ ciImage: CIImage?) -> CIImage? {
        guard let _ciImage = ciImage else { return nil }
        
        let filters = _ciImage.autoAdjustmentFilters(options: [CIImageAutoAdjustmentOption.enhance : true, CIImageAutoAdjustmentOption.redEye : false])
        
        return filters.reduce(ciImage) { result, filter in
            filter.setValue(result, forKey: kCIInputImageKey)
            return filter.outputImage
        }
    }
}

public struct AutoAdjustRedEye: Processable {
    
    public var name: String = "AutoAdjustRedEye"
    
    public init() {}
    
    public func processing(_ ciImage: CIImage?) -> CIImage? {
        guard let _ciImage = ciImage else { return nil }
        
        let filters = _ciImage.autoAdjustmentFilters(options: [CIImageAutoAdjustmentOption.enhance : false, CIImageAutoAdjustmentOption.redEye : true])
        
        return filters.reduce(ciImage) { result, filter in
            filter.setValue(result, forKey: kCIInputImageKey)
            return filter.outputImage
        }
    }
}
