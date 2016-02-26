//
//  Sharpen.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

public struct SharpenLuminance: Filterable, FilterInputCollectionType,
InputSharpnessAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CISharpenLuminance")!
    
    public let inputSharpness: ScalarInput
    
    public init() {
        self.inputSharpness = ScalarInput(filter: self.filter, key: kCIInputSharpnessKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputSharpness
        ]
    }
}

public struct UnsharpMask: Filterable, FilterInputCollectionType,
InputRadiusAvailable, InputIntensityAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIUnsharpMask")!
    
    public let inputRadius: ScalarInput
    public let inputIntensity: ScalarInput
    
    public init() {
        self.inputRadius = ScalarInput(filter: self.filter, key: kCIInputRadiusKey)
        self.inputIntensity = ScalarInput(filter: self.filter, key: kCIInputIntensityKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputRadius,
            self.inputIntensity
        ]
    }
}