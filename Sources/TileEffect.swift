//
//  TileEffect.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

public struct AffineClamp: Filterable, FilterInputCollectionType,
InputAffineTransformAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIAffineClamp")!
    
    public var inputTransform: AffineTransformInput
    
    public init() {
        self.inputTransform = AffineTransformInput()
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputTransform
        ]
    }
}

public struct AffineTile: Filterable, FilterInputCollectionType,
InputAffineTransformAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIAffineTile")!
    
    public var inputTransform: AffineTransformInput
    
    public init() {
        self.inputTransform = AffineTransformInput()
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputTransform
        ]
    }
}

public struct EightfoldReflectedTile: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputAngleAvailable, InputWidthAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIEightfoldReflectedTile")!
    
    public let inputCenter: VectorInput
    public let inputAngle: ScalarInput
    public let inputWidth: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputAngle = ScalarInput(filter: self.filter, key: kCIInputAngleKey)
        self.inputWidth = ScalarInput(filter: self.filter, key: kCIInputWidthKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputAngle,
            self.inputWidth,
        ]
    }
}

public struct FourfoldReflectedTile: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputAngleAvailable, InputAcuteAngleAvailable,
InputWidthAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIFourfoldReflectedTile")!
    
    public let inputCenter: VectorInput
    public let inputAngle: ScalarInput
    public let inputAcuteAngle: ScalarInput
    public let inputWidth: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputAngle = ScalarInput(filter: self.filter, key: kCIInputAngleKey)
        self.inputAcuteAngle = ScalarInput(filter: self.filter, key: "inputAcuteAngle")
        self.inputWidth = ScalarInput(filter: self.filter, key: kCIInputWidthKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputAngle,
            self.inputAcuteAngle,
            self.inputWidth,
        ]
    }
}

public struct FourfoldRotatedTile: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputAngleAvailable, InputWidthAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIFourfoldRotatedTile")!
    
    public let inputCenter: VectorInput
    public let inputAngle: ScalarInput
    public let inputWidth: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputAngle = ScalarInput(filter: self.filter, key: kCIInputAngleKey)
        self.inputWidth = ScalarInput(filter: self.filter, key: kCIInputWidthKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputAngle,
            self.inputWidth,
        ]
    }
}

public struct FourfoldTranslatedTile: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputAngleAvailable, InputAcuteAngleAvailable,
InputWidthAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIFourfoldTranslatedTile")!
    
    public let inputCenter: VectorInput
    public let inputAngle: ScalarInput
    public let inputAcuteAngle: ScalarInput
    public let inputWidth: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputAngle = ScalarInput(filter: self.filter, key: kCIInputAngleKey)
        self.inputAcuteAngle = ScalarInput(filter: self.filter, key: "inputAcuteAngle")
        self.inputWidth = ScalarInput(filter: self.filter, key: kCIInputWidthKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputAngle,
            self.inputAcuteAngle,
            self.inputWidth,
        ]
    }
}

public struct GlideReflectedTile: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputAngleAvailable, InputWidthAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIGlideReflectedTile")!
    
    public let inputCenter: VectorInput
    public let inputAngle: ScalarInput
    public let inputWidth: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputAngle = ScalarInput(filter: self.filter, key: kCIInputAngleKey)
        self.inputWidth = ScalarInput(filter: self.filter, key: kCIInputWidthKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputAngle,
            self.inputWidth,
        ]
    }
}

@available(iOS 9.0, *)
public struct Kaleidoscope: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputAngleAvailable, InputCountAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIKaleidoscope")!
    
    public let inputCenter: VectorInput
    public let inputAngle: ScalarInput
    public let inputCount: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputAngle = ScalarInput(filter: self.filter, key: kCIInputAngleKey)
        self.inputCount = ScalarInput(filter: self.filter, key: "inputCount")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputAngle,
            self.inputCount,
        ]
    }
}

@available(iOS 9.0, *)
public struct OpTile: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputScaleAvailable, InputAngleAvailable,
InputWidthAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIOpTile")!
    
    public let inputCenter: VectorInput
    public let inputScale: ScalarInput
    public let inputAngle: ScalarInput
    public let inputWidth: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputScale = ScalarInput(filter: self.filter, key: kCIInputScaleKey)
        self.inputAngle = ScalarInput(filter: self.filter, key: kCIInputAngleKey)
        self.inputWidth = ScalarInput(filter: self.filter, key: kCIInputWidthKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputScale,
            self.inputAngle,
            self.inputWidth,
        ]
    }
}

@available(iOS 9.0, *)
public struct ParallelogramTile: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputAngleAvailable, InputAcuteAngleAvailable,
InputWidthAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIParallelogramTile")!
    
    public let inputCenter: VectorInput
    public let inputAngle: ScalarInput
    public let inputAcuteAngle: ScalarInput
    public let inputWidth: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputAngle = ScalarInput(filter: self.filter, key: kCIInputAngleKey)
        self.inputAcuteAngle = ScalarInput(filter: self.filter, key: "inputAcuteAngle")
        self.inputWidth = ScalarInput(filter: self.filter, key: kCIInputWidthKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputAngle,
            self.inputAcuteAngle,
            self.inputWidth,
        ]
    }
}

public struct PerspectiveTile: Filterable, FilterInputCollectionType,
InputTopLeftAvailable, InputTopRightAvailable, InputBottomRightAvailable,
InputBottomLeftAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIPerspectiveTile")!
    
    public let inputTopLeft: VectorInput
    public let inputTopRight: VectorInput
    public let inputBottomLeft: VectorInput
    public let inputBottomRight: VectorInput
    
    public init(imageSize: CGSize) {
        self.inputTopLeft = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, "inputTopLeft")
        self.inputTopRight = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, "inputTopRight")
        self.inputBottomLeft = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, "inputBottomLeft")
        self.inputBottomRight = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, "inputBottomRight")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputTopLeft,
            self.inputTopRight,
            self.inputBottomLeft,
            self.inputBottomRight,
        ]
    }
}

public struct SixfoldReflectedTile: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputAngleAvailable, InputWidthAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CISixfoldReflectedTile")!
    
    public let inputCenter: VectorInput
    public let inputAngle: ScalarInput
    public let inputWidth: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputAngle = ScalarInput(filter: self.filter, key: kCIInputAngleKey)
        self.inputWidth = ScalarInput(filter: self.filter, key: kCIInputWidthKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputAngle,
            self.inputWidth,
        ]
    }
}

public struct SixfoldRotatedTile: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputAngleAvailable, InputWidthAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CISixfoldRotatedTile")!
    
    public let inputCenter: VectorInput
    public let inputAngle: ScalarInput
    public let inputWidth: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputAngle = ScalarInput(filter: self.filter, key: kCIInputAngleKey)
        self.inputWidth = ScalarInput(filter: self.filter, key: kCIInputWidthKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputAngle,
            self.inputWidth,
        ]
    }
}

public struct TriangleKaleidoscope: Filterable, FilterInputCollectionType,
InputPointAvailable, InputSizeAvailable, InputRotationAvailable,
InputDecayAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CITriangleKaleidoscope")!
    
    public let inputPoint: VectorInput
    public let inputSize: ScalarInput
    public let inputRotation: ScalarInput
    public let inputDecay: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputPoint = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, "inputPoint")
        self.inputSize = ScalarInput(filter: self.filter, key: "inputSize")
        self.inputRotation = ScalarInput(filter: self.filter, key: "inputRotation")
        self.inputDecay = ScalarInput(filter: self.filter, key: "inputDecay")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputPoint,
            self.inputSize,
            self.inputRotation,
            self.inputDecay,
        ]
    }
}

@available(iOS 9.0, *)
public struct TriangleTile: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputAngleAvailable, InputWidthAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CITriangleTile")!
    
    public let inputCenter: VectorInput
    public let inputAngle: ScalarInput
    public let inputWidth: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputAngle = ScalarInput(filter: self.filter, key: kCIInputAngleKey)
        self.inputWidth = ScalarInput(filter: self.filter, key: kCIInputWidthKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputAngle,
            self.inputWidth,
        ]
    }
}

public struct TwelvefoldReflectedTile: Filterable, FilterInputCollectionType,
InputCenterAvailable, InputAngleAvailable, InputWidthAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CITwelvefoldReflectedTile")!
    
    public let inputCenter: VectorInput
    public let inputAngle: ScalarInput
    public let inputWidth: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputCenter = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, kCIInputCenterKey)
        self.inputAngle = ScalarInput(filter: self.filter, key: kCIInputAngleKey)
        self.inputWidth = ScalarInput(filter: self.filter, key: kCIInputWidthKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputCenter,
            self.inputAngle,
            self.inputWidth,
        ]
    }
}

