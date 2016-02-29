//
//  DistortionEffect.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

public struct BumpDistortion: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputRadiusAvailable, InputScaleAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIBumpDistortion")!
    
    public let inputCenter: VectorInput
    public let inputRadius: ScalarInput
    public let inputScale: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputRadius = ScalarInput(filter: self.filter, key: kCIInputRadiusKey)
        self.inputScale = ScalarInput(filter: self.filter, key: kCIInputScaleKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputRadius,
            self.inputScale
        ]
    }
}

public struct CircleSplashDistortion: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputRadiusAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CICircleSplashDistortion")!
    
    public let inputCenter: VectorInput
    public let inputRadius: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputRadius = ScalarInput(filter: self.filter, key: kCIInputRadiusKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputRadius
        ]
    }
}

@available(iOS 9.0, *)
public struct CircularWrap: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputRadiusAvailable, InputAngleAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CICircularWrap")!
    
    public let inputCenter: VectorInput
    public let inputRadius: ScalarInput
    public let inputAngle: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputRadius = ScalarInput(filter: self.filter, key: kCIInputRadiusKey)
        self.inputAngle = ScalarInput(filter: self.filter, key: kCIInputAngleKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputRadius,
            self.inputAngle
        ]
    }
}

@available(iOS 9.0, *)
public struct Droste: Filterable, FilterInputCollectionType,
InputInsetPoint0Available, InputInsetPoint1Available, InputStrandsAvailable,
InputPeriodicityAvailable, InputRotationAvailable, InputZoomAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIDroste")!
    
    public let inputInsetPoint0: VectorInput
    public let inputInsetPoint1: VectorInput
    public let inputStrands: ScalarInput
    public let inputPeriodicity: ScalarInput
    public let inputRotation: ScalarInput
    public let inputZoom: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputInsetPoint0 = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, "inputInsetPoint0")
        self.inputInsetPoint1 = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, "inputInsetPoint1")
        self.inputStrands = ScalarInput(filter: self.filter, key: "inputStrands")
        self.inputPeriodicity = ScalarInput(filter: self.filter, key: "inputPeriodicity")
        self.inputRotation = ScalarInput(filter: self.filter, key: "inputRotation")
        self.inputZoom = ScalarInput(filter: self.filter, key: "inputZoom")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputInsetPoint0,
            self.inputInsetPoint1,
            self.inputStrands,
            self.inputPeriodicity,
            self.inputRotation,
            self.inputZoom
        ]
    }
}

@available(iOS 9.0, *)
public struct DisplacementDistortion: Filterable, FilterInputCollectionType,
InputDisplacementImageAvailable, InputScaleAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIDisplacementDistortion")!
    
    public let inputDisplacementImage: ImageInput
    public let inputScale: ScalarInput
    
    public init(image: UIImage) {
        self.inputDisplacementImage = ImageInput(image: CIImage(CGImage: image.CGImage!), key: "inputDisplacementImage")
        self.inputScale = ScalarInput(filter: self.filter, key: kCIInputScaleKey)
    }
    
    public init(image: CIImage) {
        self.inputDisplacementImage = ImageInput(image: image, key: "inputDisplacementImage")
        self.inputScale = ScalarInput(filter: self.filter, key: kCIInputScaleKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputDisplacementImage,
            self.inputScale
        ]
    }
}

@available(iOS 9.0, *)
public struct GlassDistortion: Filterable, FilterInputCollectionType,
InputTextureAvailable, InputCenterAvailable, InputScaleAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIGlassDistortion")!
    
    public let inputTexture: ImageInput
    public let inputCenter: VectorInput
    public let inputScale: ScalarInput
    
    public init(image: UIImage, imageSize: CGSize) {
        self.inputTexture = ImageInput(image: CIImage(CGImage: image.CGImage!), key: "inputTexture")
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputScale = ScalarInput(filter: self.filter, key: kCIInputScaleKey)
    }
    
    public init(image: CIImage, imageSize: CGSize) {
        self.inputTexture = ImageInput(image: image, key: "inputTexture")
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputScale = ScalarInput(filter: self.filter, key: kCIInputScaleKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputTexture,
            self.inputCenter,
            self.inputScale
        ]
    }
}

@available(iOS 9.0, *)
public struct GlassLozenge: Filterable, FilterInputCollectionType,
InputPoint0Available, InputPoint1Available, InputRadiusAvailable,
InputRefractionAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIGlassLozenge")!
    
    public let inputPoint0: VectorInput
    public let inputPoint1: VectorInput
    public let inputRadius: ScalarInput
    public let inputRefraction: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputPoint0 = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, "inputPoint0")
        self.inputPoint1 = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, "inputPoint1")
        self.inputRadius = ScalarInput(filter: self.filter, key: kCIInputRadiusKey)
        self.inputRefraction = ScalarInput(filter: self.filter, key: "inputRefraction")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputPoint0,
            self.inputPoint1,
            self.inputRadius,
            self.inputRefraction
        ]
    }
}

public struct HoleDistortion: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputRadiusAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIHoleDistortion")!
    
    public let inputCenter: VectorInput
    public let inputRadius: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputRadius = ScalarInput(filter: self.filter, key: kCIInputRadiusKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputRadius,
        ]
    }
}

public struct LightTunnel: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputRotationAvailable, InputRadiusAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CILightTunnel")!
    
    public let inputCenter: VectorInput
    public let inputRotation: ScalarInput
    public let inputRadius: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputRotation = ScalarInput(filter: self.filter, key: "inputRotation")
        self.inputRadius = ScalarInput(filter: self.filter, key: kCIInputRadiusKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputRotation,
            self.inputRadius,
        ]
    }
}

public struct PinchDistortion: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputRadiusAvailable, InputScaleAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIPinchDistortion")!
    
    public let inputCenter: VectorInput
    public let inputRadius: ScalarInput
    public let inputScale: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputRadius = ScalarInput(filter: self.filter, key: kCIInputRadiusKey)
        self.inputScale = ScalarInput(filter: self.filter, key: kCIInputScaleKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputRadius,
            self.inputScale
        ]
    }
}

@available(iOS 9.0, *)
public struct StretchCrop: Filterable, FilterInputCollectionType,
InputVectorSizeAvailable, InputCropAmountAvailable, InputCenterStretchAmountAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIStretchCrop")!
    
    public let inputVectorSize: VectorInput
    public let inputCropAmount: ScalarInput
    public let inputCenterStretchAmount: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputVectorSize = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, "inputSize")
        self.inputCropAmount = ScalarInput(filter: self.filter, key: "inputCropAmount")
        self.inputCenterStretchAmount = ScalarInput(filter: self.filter, key: "inputCenterStretchAmount")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputVectorSize,
            self.inputCropAmount,
            self.inputCenterStretchAmount
        ]
    }
}

@available(iOS 9.0, *)
public struct TorusLensDistortion: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputRadiusAvailable, InputWidthAvailable,
InputRefractionAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CITorusLensDistortion")!
    
    public let inputCenter: VectorInput
    public let inputRadius: ScalarInput
    public let inputWidth: ScalarInput
    public let inputRefraction: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputRadius = ScalarInput(filter: self.filter, key: kCIInputRadiusKey)
        self.inputWidth = ScalarInput(filter: self.filter, key: kCIInputWidthKey)
        self.inputRefraction = ScalarInput(filter: self.filter, key: "inputRefraction")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputRadius,
            self.inputWidth,
            self.inputRefraction
        ]
    }
}

public struct TwirlDistortion: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputRadiusAvailable, InputAngleAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CITwirlDistortion")!
    
    public let inputCenter: VectorInput
    public let inputRadius: ScalarInput
    public let inputAngle: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputRadius = ScalarInput(filter: self.filter, key: kCIInputRadiusKey)
        self.inputAngle = ScalarInput(filter: self.filter, key: kCIInputAngleKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputRadius,
            self.inputAngle
        ]
    }
}

public struct VortexDistortion: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputRadiusAvailable, InputAngleAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIVortexDistortion")!
    
    public let inputCenter: VectorInput
    public let inputRadius: ScalarInput
    public let inputAngle: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputRadius = ScalarInput(filter: self.filter, key: kCIInputRadiusKey)
        self.inputAngle = ScalarInput(filter: self.filter, key: kCIInputAngleKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputRadius,
            self.inputAngle
        ]
    }
}