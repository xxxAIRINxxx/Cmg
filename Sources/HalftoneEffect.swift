//
//  HalftoneEffect.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

public struct CircularScreen: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputWidthAvailable, InputSharpnessAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CICircularScreen")!
    
    public let inputCenter: VectorInput
    public let inputWidth: ScalarInput
    public let inputSharpness: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputWidth = ScalarInput(filter: self.filter, key: kCIInputWidthKey)
        self.inputSharpness = ScalarInput(filter: self.filter, key: kCIInputSharpnessKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputWidth,
            self.inputSharpness
        ]
    }
}

@available(iOS 9.0, *)
public struct CMYKHalftone: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputWidthAvailable, InputSharpnessAvailable,
InputAngleAvailable, InputGCRAvailable, InputUCRAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CICMYKHalftone")!
    
    public let inputCenter: VectorInput
    public let inputWidth: ScalarInput
    public let inputSharpness: ScalarInput
    public let inputAngle: ScalarInput
    public let inputGCR: ScalarInput
    public let inputUCR: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputWidth = ScalarInput(filter: self.filter, key: kCIInputWidthKey)
        self.inputSharpness = ScalarInput(filter: self.filter, key: kCIInputSharpnessKey)
        self.inputAngle = ScalarInput(filter: self.filter, key: kCIInputAngleKey)
        self.inputGCR = ScalarInput(filter: self.filter, key: "inputGCR")
        self.inputUCR = ScalarInput(filter: self.filter, key: "inputUCR")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputWidth,
            self.inputSharpness,
            self.inputAngle,
            self.inputGCR,
            self.inputUCR
        ]
    }
}

public struct DotScreen: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputWidthAvailable, InputSharpnessAvailable,
InputAngleAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIDotScreen")!
    
    public let inputCenter: VectorInput
    public let inputWidth: ScalarInput
    public let inputSharpness: ScalarInput
    public let inputAngle: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputWidth = ScalarInput(filter: self.filter, key: kCIInputWidthKey)
        self.inputSharpness = ScalarInput(filter: self.filter, key: kCIInputSharpnessKey)
        self.inputAngle = ScalarInput(filter: self.filter, key: kCIInputAngleKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputWidth,
            self.inputSharpness,
            self.inputAngle,
        ]
    }
}

public struct HatchedScreen: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputWidthAvailable, InputSharpnessAvailable,
InputAngleAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIHatchedScreen")!
    
    public let inputCenter: VectorInput
    public let inputWidth: ScalarInput
    public let inputSharpness: ScalarInput
    public let inputAngle: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputWidth = ScalarInput(filter: self.filter, key: kCIInputWidthKey)
        self.inputSharpness = ScalarInput(filter: self.filter, key: kCIInputSharpnessKey)
        self.inputAngle = ScalarInput(filter: self.filter, key: kCIInputAngleKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputWidth,
            self.inputSharpness,
            self.inputAngle,
        ]
    }
}

public struct LineScreen: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputWidthAvailable, InputSharpnessAvailable,
InputAngleAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CILineScreen")!
    
    public let inputCenter: VectorInput
    public let inputWidth: ScalarInput
    public let inputSharpness: ScalarInput
    public let inputAngle: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputWidth = ScalarInput(filter: self.filter, key: kCIInputWidthKey)
        self.inputSharpness = ScalarInput(filter: self.filter, key: kCIInputSharpnessKey)
        self.inputAngle = ScalarInput(filter: self.filter, key: kCIInputAngleKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputWidth,
            self.inputSharpness,
            self.inputAngle,
        ]
    }
}