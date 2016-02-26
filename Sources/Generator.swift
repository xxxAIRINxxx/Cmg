//
//  Generator.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

public struct AztecCodeGenerator: InputImageUnusable, FilterInputCollectionType,
InputMessageAvailable, InputCorrectionLevelAvailable, InputLayersAvailable,
InputCompactStyleAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIAztecCodeGenerator")!
    
    public let inputMessage: StringInput
    public let inputCorrectionLevel: ScalarInput
    public let inputLayers: ScalarInput
    public let inputCompactStyle: BooleanInput
    
    public init(message: String) {
        self.inputMessage = StringInput(filter: self.filter, key: "inputMessage", message)
        self.inputCorrectionLevel = ScalarInput(filter: self.filter, key: "inputCorrectionLevel")
        self.inputLayers = ScalarInput(filter: self.filter, key: "inputLayers")
        self.inputCompactStyle = BooleanInput(filter: self.filter, key: "inputCompactStyle")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputMessage,
            self.inputCorrectionLevel,
            self.inputLayers,
            self.inputCompactStyle
        ]
    }
}

public struct CheckerboardGenerator: InputImageUnusable, FilterInputCollectionType,
InputCenterAvailable, InputColor0Available, InputColor1Available,
InputWidthAvailable, InputSharpnessAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CICheckerboardGenerator")!
    
    public let inputCenter: VectorInput
    public let inputColor0: ColorInput
    public let inputColor1: ColorInput
    public let inputWidth: ScalarInput
    public let inputSharpness: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputColor0 = ColorInput(filter: self.filter, key: "inputColor0")
        self.inputColor1 = ColorInput(filter: self.filter, key: "inputColor1")
        self.inputWidth = ScalarInput(filter: self.filter, key: kCIInputWidthKey)
        self.inputSharpness = ScalarInput(filter: self.filter, key: kCIInputSharpnessKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputColor0,
            self.inputColor1,
            self.inputWidth,
            self.inputSharpness
        ]
    }
}

public struct Code128BarcodeGenerator: InputImageUnusable, FilterInputCollectionType,
InputMessageAvailable, InputQuietSpaceAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CICode128BarcodeGenerator")!
    
    public let inputMessage: StringInput
    public let inputQuietSpace: ScalarInput
    
    public init(message: String) {
        self.inputMessage = StringInput(filter: self.filter, key: "inputMessage", message, true, NSASCIIStringEncoding)
        self.inputQuietSpace = ScalarInput(filter: self.filter, key: "inputQuietSpace")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputMessage,
            self.inputQuietSpace
        ]
    }
}

public struct ConstantColorGenerator: InputImageUnusable, FilterInputCollectionType,
InputColorAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIConstantColorGenerator")!
    
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

@available(iOS 9.0, *)
public struct LenticularHaloGenerator: InputImageUnusable, FilterInputCollectionType,
InputCenterAvailable, InputColorAvailable, InputHaloRadiusAvailable,
InputHaloWidthAvailable, InputHaloOverlapAvailable, InputStriationStrengthAvailable,
InputStriationContrastAvailable, InputTimeAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CILenticularHaloGenerator")!
    
    public let inputCenter: VectorInput
    public let inputColor: ColorInput
    public let inputHaloRadius: ScalarInput
    public let inputHaloWidth: ScalarInput
    public let inputHaloOverlap: ScalarInput
    public let inputStriationStrength: ScalarInput
    public let inputStriationContrast: ScalarInput
    public let inputTime: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputColor = ColorInput(filter: self.filter, key: kCIInputColorKey)
        self.inputHaloRadius = ScalarInput(filter: self.filter, key: "inputHaloRadius")
        self.inputHaloWidth = ScalarInput(filter: self.filter, key: "inputHaloWidth")
        self.inputHaloOverlap = ScalarInput(filter: self.filter, key: "inputHaloOverlap")
        self.inputStriationStrength = ScalarInput(filter: self.filter, key: "inputStriationStrength")
        self.inputStriationContrast = ScalarInput(filter: self.filter, key: "inputStriationContrast")
        self.inputTime = ScalarInput(filter: self.filter, key: "inputTime")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputColor,
            self.inputHaloRadius,
            self.inputHaloWidth,
            self.inputHaloOverlap,
            self.inputStriationStrength,
            self.inputStriationContrast,
            self.inputTime
        ]
    }
}

@available(iOS 9.0, *)
public struct PDF417BarcodeGenerator: InputImageUnusable, FilterInputCollectionType,
InputMessageAvailable, InputMinWidthAvailable, InputMaxWidthAvailable,
InputMinHeightAvailable, InputMaxHeightAvailable, InputDataColumnsAvailable,
InputRowsAvailable, InputPreferredAspectRatioAvailable, InputCompactionModeAvailable,
InputCompactStyleAvailable, InputCorrectionLevelAvailable, InputAlwaysSpecifyCompactionAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIPDF417BarcodeGenerator")!
    
    public let inputMessage: StringInput
    public let inputMinWidth: VectorInput
    public let inputMaxWidth: VectorInput
    public let inputMinHeight: VectorInput
    public let inputMaxHeight: VectorInput
    public let inputDataColumns: ScalarInput
    public let inputRows: ScalarInput
    public let inputPreferredAspectRatio: ScalarInput
    public let inputCompactionMode: ScalarInput
    public let inputCompactStyle: BooleanInput
    public let inputCorrectionLevel: ScalarInput
    public let inputAlwaysSpecifyCompaction: ScalarInput
    
    public init(inputMessage: String, imageSize: CGSize) {
        self.inputMessage = StringInput(filter: self.filter, key: "inputMessage", inputMessage, true, NSISOLatin1StringEncoding)
        self.inputMinWidth = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, "inputMinWidth")
        self.inputMaxWidth = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, "inputMaxWidth")
        self.inputMinHeight = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, "inputMinHeight")
        self.inputMaxHeight = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, "inputMaxHeight")
        self.inputDataColumns = ScalarInput(filter: self.filter, key: "inputDataColumns")
        self.inputRows = ScalarInput(filter: self.filter, key: "inputRows", 45.0)
        self.inputPreferredAspectRatio = ScalarInput(filter: self.filter, key: "inputPreferredAspectRatio")
        self.inputCompactionMode = ScalarInput(filter: self.filter, key: "inputCompactionMode")
        self.inputCompactStyle = BooleanInput(filter: self.filter, key: "inputCompactStyle")
        self.inputCorrectionLevel = ScalarInput(filter: self.filter, key: "inputCorrectionLevel")
        self.inputAlwaysSpecifyCompaction = ScalarInput(filter: self.filter, key: "inputAlwaysSpecifyCompaction")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputMessage,
            self.inputMinWidth,
            self.inputMaxWidth,
            self.inputMinHeight,
            self.inputMaxHeight,
            self.inputDataColumns,
            self.inputRows,
            self.inputPreferredAspectRatio,
            self.inputCompactionMode,
            self.inputCompactStyle,
            self.inputCorrectionLevel,
            self.inputAlwaysSpecifyCompaction
        ]
    }
}

public struct QRCodeGenerator: InputImageUnusable, FilterInputCollectionType,
InputMessageAvailable, InputStringCorrectionLevelAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIQRCodeGenerator")!
    
    public let inputMessage: StringInput
    public let inputStringCorrectionLevel: StringInput
    
    public init(message: String) {
        self.inputMessage = StringInput(filter: self.filter, key: "inputMessage", message)
        self.inputStringCorrectionLevel = StringInput(filter: self.filter, key: "inputCorrectionLevel", nil, false)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputMessage,
            self.inputStringCorrectionLevel
        ]
    }
}

public struct RandomGenerator: InputImageUnusable {
    
    public let filter: CIFilter = CIFilter(name: "CIRandomGenerator")!
    
    public init() {}
}

public struct StarShineGenerator: InputImageUnusable, FilterInputCollectionType,
InputCenterAvailable, InputColorAvailable, InputRadiusAvailable,
InputCrossScaleAvailable, InputCrossAngleAvailable, InputCrossOpacityAvailable,
InputCrossWidthAvailable, InputEpsilonAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIStarShineGenerator")!
    
    public let inputCenter: VectorInput
    public let inputColor: ColorInput
    public let inputRadius: ScalarInput
    public let inputCrossScale: ScalarInput
    public let inputCrossAngle: ScalarInput
    public let inputCrossOpacity: ScalarInput
    public let inputCrossWidth: ScalarInput
    public let inputEpsilon: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputColor = ColorInput(filter: self.filter, key: kCIInputColorKey)
        self.inputRadius = ScalarInput(filter: self.filter, key: kCIInputRadiusKey)
        self.inputCrossScale = ScalarInput(filter: self.filter, key: "inputCrossScale")
        self.inputCrossAngle = ScalarInput(filter: self.filter, key: "inputCrossAngle")
        self.inputCrossOpacity = ScalarInput(filter: self.filter, key: "inputCrossOpacity")
        self.inputCrossWidth = ScalarInput(filter: self.filter, key: "inputCrossWidth")
        self.inputEpsilon = ScalarInput(filter: self.filter, key: "inputEpsilon")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputColor,
            self.inputRadius,
            self.inputCrossScale,
            self.inputCrossAngle,
            self.inputCrossOpacity,
            self.inputCrossWidth,
            self.inputEpsilon
        ]
    }
}

public struct StripesGenerator: InputImageUnusable, FilterInputCollectionType,
InputCenterAvailable, InputColor0Available, InputColor1Available,
InputWidthAvailable, InputSharpnessAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIStripesGenerator")!
    
    public let inputCenter: VectorInput
    public let inputColor0: ColorInput
    public let inputColor1: ColorInput
    public let inputWidth: ScalarInput
    public let inputSharpness: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputColor0 = ColorInput(filter: self.filter, key: "inputColor0")
        self.inputColor1 = ColorInput(filter: self.filter, key: "inputColor1")
        self.inputWidth = ScalarInput(filter: self.filter, key: kCIInputWidthKey)
        self.inputSharpness = ScalarInput(filter: self.filter, key: kCIInputSharpnessKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputColor0,
            self.inputColor1,
            self.inputWidth,
            self.inputSharpness
        ]
    }
}

@available(iOS 9.0, *)
public struct SunbeamsGenerator: InputImageUnusable, FilterInputCollectionType,
InputCenterAvailable, InputColorAvailable, InputSunRadiusAvailable,
InputMaxStriationRadiusAvailable, InputStriationStrengthAvailable, InputStriationContrastAvailable,
InputTimeAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CISunbeamsGenerator")!
    
    public let inputCenter: VectorInput
    public let inputColor: ColorInput
    public let inputSunRadius: ScalarInput
    public let inputMaxStriationRadius: ScalarInput
    public let inputStriationStrength: ScalarInput
    public let inputStriationContrast: ScalarInput
    public let inputTime: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputColor = ColorInput(filter: self.filter, key: kCIInputColorKey)
        self.inputSunRadius = ScalarInput(filter: self.filter, key: "inputSunRadius")
        self.inputMaxStriationRadius = ScalarInput(filter: self.filter, key: "inputMaxStriationRadius")
        self.inputStriationStrength = ScalarInput(filter: self.filter, key: "inputStriationStrength")
        self.inputStriationContrast = ScalarInput(filter: self.filter, key: "inputStriationContrast")
        self.inputTime = ScalarInput(filter: self.filter, key: "inputTime")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputColor,
            self.inputSunRadius,
            self.inputMaxStriationRadius,
            self.inputStriationStrength,
            self.inputStriationContrast,
            self.inputTime
        ]
    }
}
