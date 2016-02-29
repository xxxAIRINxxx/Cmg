//
//  ColorAdjustment.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

public struct ColorClamp: Filterable, FilterInputCollectionType,
InputMinComponentsAvailable, InputMaxComponentsAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIColorClamp")!
    
    public let inputMinComponents: VectorInput
    public let inputMaxComponents: VectorInput
    
    public init() {
        self.inputMinComponents = VectorInput(.Color, self.filter, "inputMinComponents")
        self.inputMaxComponents = VectorInput(.Color, self.filter, "inputMaxComponents")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputMinComponents,
            self.inputMaxComponents
        ]
    }
}

public struct ColorControls: Filterable, FilterInputCollectionType,
InputSaturationAvailable, InputBrightnessAvailable, InputContrastAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIColorControls")!
    
    public let inputSaturation: ScalarInput
    public let inputBrightness: ScalarInput
    public let inputContrast: ScalarInput
    
    public init() {
        self.inputSaturation = ScalarInput(filter: self.filter, key: kCIInputSaturationKey)
        self.inputBrightness = ScalarInput(filter: self.filter, key: kCIInputBrightnessKey)
        self.inputContrast = ScalarInput(filter: self.filter, key: kCIInputContrastKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputSaturation,
            self.inputBrightness,
            self.inputContrast
        ]
    }
}

public struct ColorMatrix: Filterable, FilterInputCollectionType,
InputRVectorAvailable, InputGVectorAvailable, InputBVectorAvailable, InputAVectorAvailable, InputBiasVectorAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIColorMatrix")!
    
    public let inputRVector: VectorInput
    public let inputGVector: VectorInput
    public let inputBVector: VectorInput
    public let inputAVector: VectorInput
    public let inputBiasVector: VectorInput
    
    public init() {
        self.inputRVector = VectorInput(.Color, self.filter, "inputRVector")
        self.inputGVector = VectorInput(.Color, self.filter, "inputGVector")
        self.inputBVector = VectorInput(.Color, self.filter, "inputBVector")
        self.inputAVector = VectorInput(.Color, self.filter, "inputAVector")
        self.inputBiasVector = VectorInput(.Color, self.filter, "inputBiasVector")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputRVector,
            self.inputGVector,
            self.inputBVector,
            self.inputAVector,
            self.inputBiasVector
        ]
    }
}

public struct ColorPolynomial: Filterable, FilterInputCollectionType,
InputRedCoefficientsAvailable, InputGreenCoefficientsAvailable, InputBlueCoefficientsAvailable, InputAlphaCoefficientsAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIColorPolynomial")!
    
    public let inputRedCoefficients: VectorInput
    public let inputGreenCoefficients: VectorInput
    public let inputBlueCoefficients: VectorInput
    public let inputAlphaCoefficients: VectorInput
    
    public init() {
        self.inputRedCoefficients = VectorInput(.Color, self.filter, "inputRedCoefficients")
        self.inputGreenCoefficients = VectorInput(.Color, self.filter, "inputGreenCoefficients")
        self.inputBlueCoefficients = VectorInput(.Color, self.filter, "inputBlueCoefficients")
        self.inputAlphaCoefficients = VectorInput(.Color, self.filter, "inputAlphaCoefficients")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputRedCoefficients,
            self.inputGreenCoefficients,
            self.inputBlueCoefficients,
            self.inputAlphaCoefficients
        ]
    }
}

public struct ExposureAdjust: Filterable, FilterInputCollectionType,
InputEVAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIExposureAdjust")!
    
    public let inputEV: ScalarInput
    
    public init() {
        self.inputEV = ScalarInput(filter: self.filter, key: kCIInputEVKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputEV
        ]
    }
}

public struct GammaAdjust: Filterable, FilterInputCollectionType,
InputPowerAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIGammaAdjust")!
    
    public let inputPower: ScalarInput
    
    public init() {
        self.inputPower = ScalarInput(filter: self.filter, key: "inputPower")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputPower
        ]
    }
}

public struct HueAdjust: Filterable, FilterInputCollectionType,
InputAngleAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIHueAdjust")!
    
    public let inputAngle: ScalarInput
    
    public init() {
        self.inputAngle = ScalarInput(filter: self.filter, key: kCIInputAngleKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputAngle
        ]
    }
}

public struct LinearToSRGBToneCurve: Filterable {
    
    public let filter: CIFilter = CIFilter(name: "CILinearToSRGBToneCurve")!
    
    public init() {}
}

public struct SRGBToneCurveToLinear: Filterable {
    
    public let filter: CIFilter = CIFilter(name: "CISRGBToneCurveToLinear")!
    
    public init() {}
}

public struct TemperatureAndTint: Filterable,
InputNeutralAvailable, InputTargetNeutralAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CITemperatureAndTint")!
    
    public var inputNeutral: VectorInput
    public var inputTargetNeutral: VectorInput
    
    public init() {
        self.inputNeutral = VectorInput(.Other(count: 2), self.filter, "inputNeutral")
        self.inputTargetNeutral = VectorInput(.Other(count: 2), self.filter, "inputTargetNeutral")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputNeutral,
            self.inputTargetNeutral
        ]
    }
}

public struct ToneCurve: Filterable, FilterInputCollectionType,
InputPoint0Available, InputPoint1Available, InputPoint2Available, InputPoint3Available, InputPoint4Available {
    
    public let filter: CIFilter = CIFilter(name: "CIToneCurve")!
    
    public let inputPoint0: VectorInput
    public let inputPoint1: VectorInput
    public let inputPoint2: VectorInput
    public let inputPoint3: VectorInput
    public let inputPoint4: VectorInput
    
    public init() {
        self.inputPoint0 = VectorInput(.ColorOffset, self.filter, "inputPoint0")
        self.inputPoint1 = VectorInput(.ColorOffset, self.filter, "inputPoint1")
        self.inputPoint2 = VectorInput(.ColorOffset, self.filter, "inputPoint2")
        self.inputPoint3 = VectorInput(.ColorOffset, self.filter, "inputPoint3")
        self.inputPoint4 = VectorInput(.ColorOffset, self.filter, "inputPoint4")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputPoint0,
            self.inputPoint1,
            self.inputPoint2,
            self.inputPoint3,
            self.inputPoint4
        ]
    }
}

public struct Vibrance: Filterable, FilterInputCollectionType,
InputAmountAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIVibrance")!
    
    public let inputAmount: ScalarInput
    
    public init() {
        self.inputAmount = ScalarInput(filter: self.filter, key: "inputAmount")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputAmount
        ]
    }
}

public struct WhitePointAdjust: Filterable, FilterInputCollectionType,
InputColorAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIWhitePointAdjust")!
    
    public let inputColor: ColorInput
    
    public init() {
        self.inputColor = ColorInput(filter: self.filter, key: kCIInputColorKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputColor
        ]
    }
}
