//
//  Range.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

public struct Range {
    
    public let minimumValue: Float
    public let maximumValue: Float
    public let initialValue: Float
    
    public init(_ minimumValue: Float, _ maximumValue: Float, _ initialValue: Float) {
        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
        self.initialValue = initialValue
    }
    
    public func convertValue(currentValue: Float) -> Float {
        if currentValue > self.maximumValue { return self.maximumValue }
        if currentValue < self.minimumValue { return self.minimumValue }
        return currentValue
    }
    
    static func generateFromFilterAttributes(key: String, filter: CIFilter) -> Range {
        let attributes = filter.attributes[key] as? [String : AnyObject]
        
        let min = attributes?["CIAttributeSliderMin"] as? NSNumber ?? attributes?["CIAttributeMin"] as? NSNumber
        let max = attributes?["CIAttributeSliderMax"] as? NSNumber ?? attributes?["CIAttributeMax"] as? NSNumber
        let def = attributes?["CIAttributeDefault"] as? NSNumber ?? min
        
        return Range(min?.floatValue ?? Float(0), max?.floatValue ?? Float(0), def?.floatValue ?? Float(0))
    }
}