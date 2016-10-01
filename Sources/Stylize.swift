//
//  Stylize.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

public struct BlendWithAlphaMask: Filterable, FilterInputCollectionType,
InputBackgroundImageAvailable, InputMaskImageAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIBlendWithAlphaMask")!
    
    public let inputBackgroundImage: ImageInput
    public let inputMaskImage: ImageInput
    
    public init(backgroundImage: UIImage, maskImage: UIImage) {
        self.inputBackgroundImage = ImageInput(image: CIImage(cgImage: backgroundImage.cgImage!), key: kCIInputBackgroundImageKey)
        self.inputMaskImage = ImageInput(image: CIImage(cgImage: maskImage.cgImage!), key: kCIInputMaskImageKey)
    }
    
    public init(backgroundImage: CIImage, maskImage: CIImage) {
        self.inputBackgroundImage = ImageInput(image:backgroundImage, key: kCIInputBackgroundImageKey)
        self.inputMaskImage = ImageInput(image: maskImage, key: kCIInputMaskImageKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputBackgroundImage,
            self.inputMaskImage
        ]
    }
}

public struct BlendWithMask: Filterable, FilterInputCollectionType,
InputBackgroundImageAvailable, InputMaskImageAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIBlendWithMask")!
    
    public let inputBackgroundImage: ImageInput
    public let inputMaskImage: ImageInput
    
    public init(backgroundImage: UIImage, maskImage: UIImage) {
        self.inputBackgroundImage = ImageInput(image: CIImage(cgImage: backgroundImage.cgImage!), key: kCIInputBackgroundImageKey)
        self.inputMaskImage = ImageInput(image: CIImage(cgImage: maskImage.cgImage!), key: kCIInputMaskImageKey)
    }
    
    public init(backgroundImage: CIImage, maskImage: CIImage) {
        self.inputBackgroundImage = ImageInput(image:backgroundImage, key: kCIInputBackgroundImageKey)
        self.inputMaskImage = ImageInput(image: maskImage, key: kCIInputMaskImageKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputBackgroundImage,
            self.inputMaskImage
        ]
    }
}

public struct Bloom: Filterable, FilterInputCollectionType,
InputRadiusAvailable, InputIntensityAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIBloom")!
    
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

@available(iOS 9.0, *)
public struct ComicEffect: Filterable {
    
    public let filter: CIFilter = CIFilter(name: "CIComicEffect")!
    
    public init() {}
}

public struct Convolution3X3: Filterable, FilterInputCollectionType,
InputWeightsAvailable, InputBiasAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIConvolution3X3")!
    
    public let inputWeights: VectorInput
    public let inputBias: ScalarInput
    
    public init() {
        self.inputWeights = VectorInput(.other(count: 9), self.filter, "inputWeights")
        self.inputBias = ScalarInput(filter: self.filter, key: "inputBias")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputWeights,
            self.inputBias
        ]
    }
}

public struct Convolution5X5: Filterable, FilterInputCollectionType,
InputWeightsAvailable, InputBiasAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIConvolution5X5")!
    
    public let inputWeights: VectorInput
    public let inputBias: ScalarInput
    
    public init() {
        self.inputWeights = VectorInput(.other(count: 25), self.filter, "inputWeights")
        self.inputBias = ScalarInput(filter: self.filter, key: "inputBias")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputWeights,
            self.inputBias
        ]
    }
}

@available(iOS 9.0, *)
public struct Convolution7X7: Filterable, FilterInputCollectionType,
InputWeightsAvailable, InputBiasAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIConvolution7X7")!
    
    public let inputWeights: VectorInput
    public let inputBias: ScalarInput
    
    public init() {
        self.inputWeights = VectorInput(.other(count: 49), self.filter, "inputWeights")
        self.inputBias = ScalarInput(filter: self.filter, key: "inputBias")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputWeights,
            self.inputBias
        ]
    }
}

public struct Convolution9Horizontal: Filterable, FilterInputCollectionType,
InputWeightsAvailable, InputBiasAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIConvolution9Horizontal")!
    
    public let inputWeights: VectorInput
    public let inputBias: ScalarInput
    
    public init() {
        self.inputWeights = VectorInput(.other(count: 9), self.filter, "inputWeights")
        self.inputBias = ScalarInput(filter: self.filter, key: "inputBias")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputWeights,
            self.inputBias
        ]
    }
}

public struct Convolution9Vertical: Filterable, FilterInputCollectionType,
InputWeightsAvailable, InputBiasAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIConvolution9Vertical")!
    
    public let inputWeights: VectorInput
    public let inputBias: ScalarInput
    
    public init() {
        self.inputWeights = VectorInput(.other(count: 9), self.filter, "inputWeights")
        self.inputBias = ScalarInput(filter: self.filter, key: "inputBias")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputWeights,
            self.inputBias
        ]
    }
}

@available(iOS 9.0, *)
public struct Crystallize: Filterable, FilterInputCollectionType,
InputRadiusAvailable, InputCenterAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CICrystallize")!
    
    public let inputRadius: ScalarInput
    public let inputCenter: VectorInput
    
    public init(imageSize: CGSize) {
        self.inputRadius = ScalarInput(filter: self.filter, key: kCIInputRadiusKey)
        self.inputCenter = VectorInput(.position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputRadius,
            self.inputCenter
        ]
    }
}

@available(iOS 9.0, *)
public struct DepthOfField: Filterable, FilterInputCollectionType,
InputPoint0Available, InputPoint1Available, InputSaturationAvailable,
InputUnsharpMaskRadiusAvailable, InputUnsharpMaskIntensityAvailable, InputRadiusAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIDepthOfField")!
    
    public let inputPoint0: VectorInput
    public let inputPoint1: VectorInput
    public let inputSaturation: ScalarInput
    public let inputUnsharpMaskRadius: ScalarInput
    public let inputUnsharpMaskIntensity: ScalarInput
    public let inputRadius: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputPoint0 = VectorInput(.position(maximumSize: Vector2(size: imageSize)), self.filter, "inputPoint0")
        self.inputPoint1 = VectorInput(.position(maximumSize: Vector2(size: imageSize)), self.filter, "inputPoint1")
        self.inputSaturation = ScalarInput(filter: self.filter, key: kCIInputSaturationKey)
        self.inputUnsharpMaskRadius = ScalarInput(filter: self.filter, key: "inputUnsharpMaskRadius")
        self.inputUnsharpMaskIntensity = ScalarInput(filter: self.filter, key: "inputUnsharpMaskIntensity")
        self.inputRadius = ScalarInput(filter: self.filter, key: kCIInputRadiusKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputPoint0,
            self.inputPoint1,
            self.inputSaturation,
            self.inputUnsharpMaskRadius,
            self.inputUnsharpMaskIntensity,
            self.inputRadius
        ]
    }
}

@available(iOS 9.0, *)
public struct Edges: Filterable, FilterInputCollectionType,
InputIntensityAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIEdges")!
    
    public let inputIntensity: ScalarInput
    
    public init() {
        self.inputIntensity = ScalarInput(filter: self.filter, key: kCIInputIntensityKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputIntensity
        ]
    }
}

@available(iOS 9.0, *)
public struct EdgeWork: Filterable, FilterInputCollectionType,
InputRadiusAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIEdgeWork")!
    
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

public struct Gloom: Filterable, FilterInputCollectionType,
InputRadiusAvailable, InputIntensityAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIGloom")!
    
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

@available(iOS 9.0, *)
public struct HeightFieldFromMask: Filterable, FilterInputCollectionType,
InputRadiusAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIHeightFieldFromMask")!
    
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
public struct HexagonalPixellate: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputScaleAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIHexagonalPixellate")!
    
    public let inputCenter: VectorInput
    public let inputScale: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputScale = ScalarInput(filter: self.filter, key: kCIInputScaleKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputScale
        ]
    }
}

public struct HighlightShadowAdjust: Filterable, FilterInputCollectionType,
InputHighlightAmountAvailable, InputShadowAmountAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIHighlightShadowAdjust")!
    
    public let inputHighlightAmount: ScalarInput
    public let inputShadowAmount: ScalarInput
    
    public init() {
        self.inputHighlightAmount = ScalarInput(filter: self.filter, key: "inputHighlightAmount")
        self.inputShadowAmount = ScalarInput(filter: self.filter, key: "inputShadowAmount")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputHighlightAmount,
            self.inputShadowAmount
        ]
    }
}

@available(iOS 9.0, *)
public struct LineOverlay: Filterable, FilterInputCollectionType,
InputNRNoiseLevelAvailable, InputNRSharpnessAvailable, InputEdgeIntensityAvailable,
InputThresholdAvailable, InputContrastAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CILineOverlay")!
    
    public let inputNRNoiseLevel: ScalarInput
    public let inputNRSharpness: ScalarInput
    public let inputEdgeIntensity: ScalarInput
    public let inputThreshold: ScalarInput
    public let inputContrast: ScalarInput
    
    public init() {
        self.inputNRNoiseLevel = ScalarInput(filter: self.filter, key: "inputNRNoiseLevel")
        self.inputNRSharpness = ScalarInput(filter: self.filter, key: "inputNRSharpness")
        self.inputEdgeIntensity = ScalarInput(filter: self.filter, key: "inputEdgeIntensity")
        self.inputThreshold = ScalarInput(filter: self.filter, key: "inputThreshold")
        self.inputContrast = ScalarInput(filter: self.filter, key: kCIInputContrastKey)
        
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputNRNoiseLevel,
            self.inputNRSharpness,
            self.inputEdgeIntensity,
            self.inputThreshold,
            self.inputContrast
        ]
    }
}

public struct Pixellate: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputScaleAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIPixellate")!
    
    public let inputCenter: VectorInput
    public let inputScale: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputScale = ScalarInput(filter: self.filter, key: kCIInputScaleKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputScale
        ]
    }
}

@available(iOS 9.0, *)
public struct Pointillize: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputRadiusAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIPointillize")!
    
    public let inputCenter: VectorInput
    public let inputRadius: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
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
public struct ShadedMaterial: Filterable, FilterInputCollectionType,
InputShadingImageAvailable, InputScaleAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIShadedMaterial")!
    
    public let inputShadingImage: ImageInput
    public let inputScale: ScalarInput
    
    public init(uiImage: UIImage) {
        self.inputShadingImage = ImageInput(image: CIImage(cgImage: uiImage.cgImage!), key: kCIInputShadingImageKey)
        self.inputScale = ScalarInput(filter: self.filter, key: kCIInputScaleKey)
    }
    
    public init(ciImage: CIImage) {
        self.inputShadingImage = ImageInput(image:ciImage, key: kCIInputShadingImageKey)
        self.inputScale = ScalarInput(filter: self.filter, key: kCIInputScaleKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputShadingImage,
            self.inputScale
        ]
    }
}



