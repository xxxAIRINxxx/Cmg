//
//  Gradient.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

public struct GaussianGradient: InputImageUnusable, FilterInputCollectionType,
InputCenterAvailable, InputRadiusAvailable, InputColor0Available,
InputColor1Available {
    
    public let filter: CIFilter = CIFilter(name: "CIGaussianGradient")!
    
    public let inputCenter: VectorInput
    public let inputColor0: ColorInput
    public let inputColor1: ColorInput
    public let inputRadius: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputRadius = ScalarInput(filter: self.filter, key: kCIInputRadiusKey)
        self.inputColor0 = ColorInput(filter: self.filter, key: "inputColor0")
        self.inputColor1 = ColorInput(filter: self.filter, key: "inputColor1")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputColor0,
            self.inputColor1,
            self.inputRadius
        ]
    }
}

public struct LinearGradient: InputImageUnusable, FilterInputCollectionType,
InputPoint0Available, InputPoint1Available, InputColor0Available,
InputColor1Available {
    
    public let filter: CIFilter = CIFilter(name: "CILinearGradient")!
    
    public var inputPoint0: VectorInput
    public var inputPoint1: VectorInput
    public let inputColor0: ColorInput
    public let inputColor1: ColorInput
    
    public init(imageSize: CGSize) {
        self.inputPoint0 = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, "inputPoint0")
        self.inputPoint1 = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, "inputPoint1")
        self.inputColor0 = ColorInput(filter: self.filter, key: "inputColor0")
        self.inputColor1 = ColorInput(filter: self.filter, key: "inputColor1")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputPoint0,
            self.inputPoint1,
            self.inputColor0,
            self.inputColor1
        ]
    }
}

public struct RadialGradient: InputImageUnusable, FilterInputCollectionType,
InputCenterAvailable, InputRadius0Available, InputRadius1Available,
InputColor0Available, InputColor1Available {
    
    public let filter: CIFilter = CIFilter(name: "CIRadialGradient")!
    
    public let inputCenter: VectorInput
    public let inputColor0: ColorInput
    public let inputColor1: ColorInput
    public let inputRadius0: ScalarInput
    public let inputRadius1: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputColor0 = ColorInput(filter: self.filter, key: "inputColor0")
        self.inputColor1 = ColorInput(filter: self.filter, key: "inputColor1")
        self.inputRadius0 = ScalarInput(filter: self.filter, key: "inputRadius0")
        self.inputRadius1 = ScalarInput(filter: self.filter, key: "inputRadius1")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputColor0,
            self.inputColor1,
            self.inputRadius0,
            self.inputRadius1
        ]
    }
}

public struct SmoothLinearGradient: InputImageUnusable, FilterInputCollectionType,
InputPoint0Available, InputPoint1Available, InputColor0Available,
InputColor1Available {
    
    public let filter: CIFilter = CIFilter(name: "CISmoothLinearGradient")!
    
    public var inputPoint0: VectorInput
    public var inputPoint1: VectorInput
    public let inputColor0: ColorInput
    public let inputColor1: ColorInput
    
    public init(imageSize: CGSize) {
        self.inputPoint0 = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, "inputPoint0")
        self.inputPoint1 = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, "inputPoint1")
        self.inputColor0 = ColorInput(filter: self.filter, key: "inputColor0")
        self.inputColor1 = ColorInput(filter: self.filter, key: "inputColor1")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputPoint0,
            self.inputPoint1,
            self.inputColor0,
            self.inputColor1
        ]
    }
}