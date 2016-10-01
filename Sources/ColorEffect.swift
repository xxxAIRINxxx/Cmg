//
//  ColorEffect.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

public struct ColorCrossPolynomial: Filterable, FilterInputCollectionType,
InputRedCoefficientsAvailable, InputGreenCoefficientsAvailable, InputBlueCoefficientsAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIColorCrossPolynomial")!
    
    public let inputRedCoefficients: VectorInput
    public let inputGreenCoefficients: VectorInput
    public let inputBlueCoefficients: VectorInput
    
    public init() {
        self.inputRedCoefficients = VectorInput(.other(count: 10), self.filter, "inputRedCoefficients")
        self.inputGreenCoefficients = VectorInput(.other(count: 10), self.filter, "inputGreenCoefficients")
        self.inputBlueCoefficients = VectorInput(.other(count: 10), self.filter, "inputBlueCoefficients")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputRedCoefficients,
            self.inputGreenCoefficients,
            self.inputBlueCoefficients
        ]
    }
}

public struct ColorCube: Filterable, InputCubeDimensionAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIColorCube")!
    
    public let inputCubeDimension: ScalarInput
    public var cubeData: Data
    
    public init(inputCubeData: Data) {
        self.inputCubeDimension = ScalarInput(filter: self.filter, key: "inputCubeDimension")
        self.cubeData = inputCubeData
    }
    
    public func sliders() -> [Slider] {
        return self.inputCubeDimension.sliders()
    }
    
    public func setupFilter() {
        self.inputCubeDimension.setInput(self.filter)
        self.filter.setValue(self.cubeData, forKey: "inputCubeData")
    }
}

public struct ColorCubeWithColorSpace: Filterable, InputCubeDimensionAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIColorCubeWithColorSpace")!
    
    public let inputCubeDimension: ScalarInput
    public var cubeData: Data
    public var colorSpace: CGColorSpace
    
    public init(inputCubeData: Data, inputColorSpace: CGColorSpace) {
        self.inputCubeDimension = ScalarInput(filter: self.filter, key: "inputCubeDimension")
        self.cubeData = inputCubeData
        self.colorSpace = inputColorSpace
    }
    
    public func sliders() -> [Slider] {
        return self.inputCubeDimension.sliders()
    }
    
    public func setupFilter() {
        self.inputCubeDimension.setInput(self.filter)
        self.filter.setValue(self.cubeData, forKey: "inputCubeData")
        self.filter.setValue(self.colorSpace, forKey: "inputColorSpace")
    }
}

public struct ColorInvert: Filterable {
    
    public let filter: CIFilter = CIFilter(name: "CIColorInvert")!
    
    public init() {}
}

public struct ColorMap: Filterable, FilterInputCollectionType,
InputImageAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIColorMap")!
    
    public let inputImage: ImageInput
    
    public init(uiImage: UIImage) {
        self.inputImage = ImageInput(image: CIImage(cgImage: uiImage.cgImage!), key: "inputGradientImage")
    }
    
    public init(ciImage: CIImage) {
        self.inputImage = ImageInput(image: ciImage, key: "inputGradientImage")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputImage
        ]
    }
}

public struct ColorMonochrome: Filterable, FilterInputCollectionType,
InputIntensityAvailable, InputColorAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIColorMonochrome")!
    
    public let inputIntensity: ScalarInput
    public let inputColor: ColorInput
    
    public init() {
        self.inputIntensity = ScalarInput(filter: self.filter, key: kCIInputIntensityKey)
        self.inputColor = ColorInput(filter: self.filter, key: kCIInputColorKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputIntensity,
            self.inputColor
        ]
    }
}

public struct ColorPosterize: Filterable, FilterInputCollectionType,
InputLevelsAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIColorPosterize")!
    
    public let inputLevels: ScalarInput
    
    public init() {
        self.inputLevels = ScalarInput(filter: self.filter, key: "inputLevels")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputLevels
        ]
    }
}

public struct FalseColor: Filterable, FilterInputCollectionType,
InputColor0Available, InputColor1Available {
    
    public let filter: CIFilter = CIFilter(name: "CIFalseColor")!
    
    public let inputColor0: ColorInput
    public let inputColor1: ColorInput
    
    public init() {
        self.inputColor0 = ColorInput(filter: self.filter, key: "inputColor0")
        self.inputColor1 = ColorInput(filter: self.filter, key: "inputColor1")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputColor0,
            self.inputColor1
        ]
    }
}

public struct MaskToAlpha: Filterable {
    
    public let filter: CIFilter = CIFilter(name: "CIMaskToAlpha")!
    
    public init() {}
}

public struct MaximumComponent: Filterable {
    
    public let filter: CIFilter = CIFilter(name: "CIMaximumComponent")!
    
    public init() {}
}

public struct MinimumComponent: Filterable {
    
    public let filter: CIFilter = CIFilter(name: "CIMinimumComponent")!
    
    public init() {}
}

public struct PhotoEffectChrome: Filterable {
    
    public let filter: CIFilter = CIFilter(name: "CIPhotoEffectChrome")!
    
    public init() {}
}

public struct PhotoEffectFade: Filterable {
    
    public let filter: CIFilter = CIFilter(name: "CIPhotoEffectFade")!
    
    public init() {}
}

public struct PhotoEffectInstant: Filterable {
    
    public let filter: CIFilter = CIFilter(name: "CIPhotoEffectInstant")!
    
    public init() {}
}

public struct PhotoEffectMono: Filterable {
    
    public let filter: CIFilter = CIFilter(name: "CIPhotoEffectMono")!
    
    public init() {}
}

public struct PhotoEffectNoir: Filterable {
    
    public let filter: CIFilter = CIFilter(name: "CIPhotoEffectNoir")!
    
    public init() {}
}

public struct PhotoEffectProcess: Filterable {
    
    public let filter: CIFilter = CIFilter(name: "CIPhotoEffectProcess")!
    
    public init() {}
}

public struct PhotoEffectTonal: Filterable {
    
    public let filter: CIFilter = CIFilter(name: "CIPhotoEffectTonal")!
    
    public init() {}
}

public struct PhotoEffectTransfer: Filterable {
    
    public let filter: CIFilter = CIFilter(name: "CIPhotoEffectTransfer")!
    
    public init() {}
}

public struct SepiaTone: Filterable, FilterInputCollectionType,
InputIntensityAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CISepiaTone")!
    
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

public struct Vignette: Filterable, FilterInputCollectionType,
InputRadiusAvailable, InputIntensityAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIVignette")!
    
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

public struct VignetteEffect: Filterable, FilterInputCollectionType,
InputIntensityAvailable, InputCenterAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIVignetteEffect")!
    
    public let inputIntensity: ScalarInput
    public let inputCenter: VectorInput
    
    public init(imageSize: CGSize) {
        self.inputIntensity = ScalarInput(filter: self.filter, key: kCIInputIntensityKey)
        self.inputCenter = VectorInput(.position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputIntensity,
            self.inputCenter
        ]
    }
}
