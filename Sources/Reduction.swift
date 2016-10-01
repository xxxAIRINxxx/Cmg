//
//  Reduction.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/22.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

@available(iOS 9.0, *)
public struct AreaAverage: Filterable, FilterInputCollectionType,
InputExtentAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIAreaAverage")!
    
    public let inputExtent: VectorInput
    
    public init(imageSize: CGSize) {
        self.inputExtent = VectorInput(.extent(extent: Vector4(size: imageSize)), self.filter, kCIInputExtentKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputExtent,
        ]
    }
}

public struct AreaHistogram: Filterable, FilterInputCollectionType,
InputExtentAvailable, InputScaleAvailable, InputCountAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIAreaHistogram")!
    
    public let inputExtent: VectorInput
    public let inputCount: ScalarInput
    public let inputScale: ScalarInput
    
    public init(imageSize: CGSize) {
        self.inputExtent = VectorInput(.extent(extent: Vector4(size: imageSize)), self.filter, kCIInputExtentKey)
        self.inputCount = ScalarInput(filter: self.filter, key: "inputCount")
        self.inputScale = ScalarInput(filter: self.filter, key: kCIInputScaleKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputExtent,
            self.inputCount,
            self.inputScale,
        ]
    }
}

@available(iOS 9.0, *)
public struct RowAverage: Filterable, FilterInputCollectionType,
InputExtentAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIRowAverage")!
    
    public let inputExtent: VectorInput
    
    public init(imageSize: CGSize) {
        self.inputExtent = VectorInput(.extent(extent: Vector4(size: imageSize)), self.filter, kCIInputExtentKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputExtent,
        ]
    }
}

@available(iOS 9.0, *)
public struct ColumnAverage: Filterable, FilterInputCollectionType,
InputExtentAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIColumnAverage")!
    
    public let inputExtent: VectorInput
    
    public init(imageSize: CGSize) {
        self.inputExtent = VectorInput(.extent(extent: Vector4(size: imageSize)), self.filter, kCIInputExtentKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputExtent,
        ]
    }
}

@available(iOS 9.0, *)
public struct HistogramDisplayFilter: Filterable, FilterInputCollectionType,
InputHeightAvailable, InputHighLimitAvailable, InputLowLimitAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIHistogramDisplayFilter")!
    
    public let inputHeight: ScalarInput
    public let inputHighLimit: ScalarInput
    public let inputLowLimit: ScalarInput
    
    public init() {
        self.inputHeight = ScalarInput(filter: self.filter, key: "inputHeight")
        self.inputHighLimit = ScalarInput(filter: self.filter, key: "inputHighLimit")
        self.inputLowLimit = ScalarInput(filter: self.filter, key: "inputLowLimit")
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputHeight,
            self.inputHighLimit,
            self.inputLowLimit,
        ]
    }
}

@available(iOS 9.0, *)
public struct AreaMaximum: Filterable, FilterInputCollectionType,
InputExtentAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIAreaMaximum")!
    
    public let inputExtent: VectorInput
    
    public init(imageSize: CGSize) {
        self.inputExtent = VectorInput(.extent(extent: Vector4(size: imageSize)), self.filter, kCIInputExtentKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputExtent,
        ]
    }
}

@available(iOS 9.0, *)
public struct AreaMinimum: Filterable, FilterInputCollectionType,
InputExtentAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIAreaMinimum")!
    
    public let inputExtent: VectorInput
    
    public init(imageSize: CGSize) {
        self.inputExtent = VectorInput(.extent(extent: Vector4(size: imageSize)), self.filter, kCIInputExtentKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputExtent,
        ]
    }
}

@available(iOS 9.0, *)
public struct AreaMaximumAlpha: Filterable, FilterInputCollectionType,
InputExtentAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIAreaMaximumAlpha")!
    
    public let inputExtent: VectorInput
    
    public init(imageSize: CGSize) {
        self.inputExtent = VectorInput(.extent(extent: Vector4(size: imageSize)), self.filter, kCIInputExtentKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputExtent,
        ]
    }
}

@available(iOS 9.0, *)
public struct AreaMinimumAlpha: Filterable, FilterInputCollectionType,
InputExtentAvailable {
    
    public let filter: CIFilter = CIFilter(name: "CIAreaMinimumAlpha")!
    
    public let inputExtent: VectorInput
    
    public init(imageSize: CGSize) {
        self.inputExtent = VectorInput(.extent(extent: Vector4(size: imageSize)), self.filter, kCIInputExtentKey)
    }
    
    public func inputs() -> [FilterInputable] {
        return [
            self.inputExtent,
        ]
    }
}
