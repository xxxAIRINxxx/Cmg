//
//  GeometryAdjustment.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

public struct AffineTransform: Filterable, FilterInputCollectionType,
InputAffineTransformAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIAffineTransform")!
    
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

public struct Crop: Filterable, FilterInputCollectionType,
InputRectangleAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CICrop")!
    
    public let inputRectangle: VectorInput
    
    public init(imageSize: CGSize) {
        self.inputRectangle = VectorInput(.Extent(extent: Vector4(size: imageSize)), self.filter, "inputRectangle")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputRectangle
        ]
    }
}

public struct LanczosScaleTransform: Filterable, FilterInputCollectionType,
InputScaleAvailable, InputAspectRatioAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CILanczosScaleTransform")!
    
    public let inputScale: ScalarInput
    public let inputAspectRatio: ScalarInput
    
    public init() {
        self.inputScale = ScalarInput(filter: self.filter, key: kCIInputScaleKey)
        self.inputAspectRatio = ScalarInput(filter: self.filter, key: kCIInputAspectRatioKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputScale,
            self.inputAspectRatio
        ]
    }
}

public struct PerspectiveCorrection: Filterable, FilterInputCollectionType,
InputTopLeftAvailable, InputTopRightAvailable, InputBottomRightAvailable,
InputBottomLeftAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIPerspectiveCorrection")!
    
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
            self.inputBottomRight
        ]
    }
}

public struct PerspectiveTransform: Filterable, FilterInputCollectionType,
InputTopLeftAvailable, InputTopRightAvailable, InputBottomRightAvailable,
InputBottomLeftAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIPerspectiveTransform")!
    
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
            self.inputBottomRight
        ]
    }
}

public struct PerspectiveTransformWithExtent: Filterable, FilterInputCollectionType,
InputExtentAvailable, InputTopLeftAvailable, InputTopRightAvailable,
InputBottomRightAvailable, InputBottomLeftAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIPerspectiveTransformWithExtent")!
    
    public let inputExtent: VectorInput
    public let inputTopLeft: VectorInput
    public let inputTopRight: VectorInput
    public let inputBottomLeft: VectorInput
    public let inputBottomRight: VectorInput
    
    public init(imageSize: CGSize) {
        self.inputExtent = VectorInput(.Extent(extent: Vector4(size: imageSize)), self.filter, kCIInputExtentKey)
        self.inputTopLeft = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, "inputTopLeft")
        self.inputTopRight = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, "inputTopRight")
        self.inputBottomLeft = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, "inputBottomLeft")
        self.inputBottomRight = VectorInput(.Position(maximumSize: Vector2(size: imageSize)), self.filter, "inputBottomRight")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputExtent,
            self.inputTopLeft,
            self.inputTopRight,
            self.inputBottomLeft,
            self.inputBottomRight
        ]
    }
}

public struct StraightenFilter: Filterable, FilterInputCollectionType,
InputAngleAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIStraightenFilter")!
    
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