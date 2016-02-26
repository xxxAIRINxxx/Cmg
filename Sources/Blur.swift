//
//  Blur.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

@available(iOS 9.0, *)
public struct BoxBlur: Filterable, FilterInputCollectionType,
InputRadiusAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIBoxBlur")!

    public let inputRadius: ScalarInput
    
    public init() {
        self.inputRadius = ScalarInput(filter: self.filter, key: kCIInputRadiusKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputRadius
        ]
    }
}

@available(iOS 9.0, *)
public struct DiscBlur: Filterable, FilterInputCollectionType,
InputRadiusAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIDiscBlur")!
    
    public let inputRadius: ScalarInput
    
    public init() {
        self.inputRadius = ScalarInput(filter: self.filter, key: kCIInputRadiusKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputRadius
        ]
    }
}

public struct GaussianBlur: Filterable, FilterInputCollectionType,
InputRadiusAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIGaussianBlur")!
    
    public let inputRadius: ScalarInput
    
    public init() {
        self.inputRadius = ScalarInput(filter: self.filter, key: kCIInputRadiusKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputRadius
        ]
    }
}

@available(iOS 9.0, *)
public struct Median: Filterable {
    
    public let filter: CIFilter = CIFilter(name: "CIMedianFilter")!
    
    public init() {}
}

@available(iOS 9.0, *)
public struct MotionBlur: Filterable, FilterInputCollectionType,
InputRadiusAvailable, InputAngleAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIMotionBlur")!
    
    public let inputRadius: ScalarInput
    public let inputAngle: ScalarInput
    
    public init() {
        self.inputRadius = ScalarInput(filter: self.filter, key: kCIInputRadiusKey)
        self.inputAngle = ScalarInput(filter: self.filter, key: kCIInputAngleKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputRadius,
            self.inputAngle
        ]
    }
}

@available(iOS 9.0, *)
public struct NoiseReduction: Filterable, FilterInputCollectionType,
InputNoiseLevelAvailable, InputSharpnessAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CINoiseReduction")!
    
    public let inputNoiseLevel: ScalarInput
    public let inputSharpness: ScalarInput
    
    public init() {
        self.inputNoiseLevel = ScalarInput(filter: self.filter, key: "inputNoiseLevel")
        self.inputSharpness = ScalarInput(filter: self.filter, key: kCIInputSharpnessKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputNoiseLevel,
            self.inputSharpness
        ]
    }
}

@available(iOS 9.0, *)
public struct ZoomBlur: Filterable, FilterInputCollectionType,
InputAmountAvailable, InputCenterAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIZoomBlur")!
    
    public let inputAmount: ScalarInput
    public let inputCenter: VectorInput
    
    public init(imageSize: CGSize) {
        self.inputAmount = ScalarInput(filter: self.filter, key: "inputAmount")
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputAmount,
            self.inputCenter
        ]
    }
}
