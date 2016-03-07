//
//  CompositeOperation.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

public protocol CompositeFilterable: Filterable {
    
    var compositeOperator: CompositeOperator { get }
    
    init(backgroundImage: CIImage)
}

extension CompositeFilterable {
    
    public var filter: CIFilter { return self.compositeOperator.filter }
    
    public var alpha: CGFloat {
        get { return self.compositeOperator.inputBackgroundImage.alpha }
        set { self.compositeOperator.inputBackgroundImage.updateAlpha(newValue) }
    }
    
    public func sliders() -> [Slider] {
        return self.compositeOperator.inputBackgroundImage.sliders()
    }
    
    public func setupFilter() {
        self.compositeOperator.inputBackgroundImage.setInput(self.filter)
    }
    
    public init(uiImage: UIImage) {
        self.init(backgroundImage: CIImage(CGImage: uiImage.CGImage!))
    }
}

public final class CompositeOperator {
    
    public let filter: CIFilter
    public let inputBackgroundImage: ImageInput
    
    public init(filter: CIFilter, _ uiImage: UIImage) {
        self.filter = filter
        self.inputBackgroundImage = ImageInput(image: CIImage(CGImage: uiImage.CGImage!), key: kCIInputBackgroundImageKey)
    }
    
    public init(filter: CIFilter, _ ciImage: CIImage) {
        self.filter = filter
        self.inputBackgroundImage = ImageInput(image: ciImage, key: kCIInputBackgroundImageKey)
    }
}

public struct AdditionCompositing: CompositeFilterable {
    
    public let compositeOperator: CompositeOperator
    
    public init(backgroundImage: CIImage) {
        self.compositeOperator = CompositeOperator.init(filter: CIFilter(name: "CIAdditionCompositing")!, backgroundImage)
    }
}

public struct ColorBlendMode: CompositeFilterable {
    
    public let compositeOperator: CompositeOperator
    
    public init(backgroundImage: CIImage) {
        self.compositeOperator = CompositeOperator.init(filter: CIFilter(name: "CIColorBlendMode")!, backgroundImage)
    }
}

public struct ColorBurnBlendMode: CompositeFilterable {
    
    public let compositeOperator: CompositeOperator
    
    public init(backgroundImage: CIImage) {
        self.compositeOperator = CompositeOperator.init(filter: CIFilter(name: "CIColorBurnBlendMode")!, backgroundImage)
    }
}

public struct ColorDodgeBlendMode: CompositeFilterable {
    
    public let compositeOperator: CompositeOperator
    
    public init(backgroundImage: CIImage) {
        self.compositeOperator = CompositeOperator.init(filter: CIFilter(name: "CIColorDodgeBlendMode")!, backgroundImage)
    }
}

public struct DarkenBlendMode: CompositeFilterable {
    
    public let compositeOperator: CompositeOperator
    
    public init(backgroundImage: CIImage) {
        self.compositeOperator = CompositeOperator.init(filter: CIFilter(name: "CIDarkenBlendMode")!, backgroundImage)
    }
}

public struct DifferenceBlendMode: CompositeFilterable {
    
    public let compositeOperator: CompositeOperator
    
    public init(backgroundImage: CIImage) {
        self.compositeOperator = CompositeOperator.init(filter: CIFilter(name: "CIDifferenceBlendMode")!, backgroundImage)
    }
}

public struct DivideBlendMode: CompositeFilterable {
    
    public let compositeOperator: CompositeOperator
    
    public init(backgroundImage: CIImage) {
        self.compositeOperator = CompositeOperator.init(filter: CIFilter(name: "CIDivideBlendMode")!, backgroundImage)
    }
}

public struct ExclusionBlendMode: CompositeFilterable {
    
    public let compositeOperator: CompositeOperator
    
    public init(backgroundImage: CIImage) {
        self.compositeOperator = CompositeOperator.init(filter: CIFilter(name: "CIExclusionBlendMode")!, backgroundImage)
    }
}

public struct HardLightBlendMode: CompositeFilterable {
    
    public let compositeOperator: CompositeOperator
    
    public init(backgroundImage: CIImage) {
        self.compositeOperator = CompositeOperator.init(filter: CIFilter(name: "CIHardLightBlendMode")!, backgroundImage)
    }
}

public struct HueBlendMode: CompositeFilterable {
    
    public let compositeOperator: CompositeOperator
    
    public init(backgroundImage: CIImage) {
        self.compositeOperator = CompositeOperator.init(filter: CIFilter(name: "CIHueBlendMode")!, backgroundImage)
    }
}

public struct LightenBlendMode: CompositeFilterable {
    
    public let compositeOperator: CompositeOperator
    
    public init(backgroundImage: CIImage) {
        self.compositeOperator = CompositeOperator.init(filter: CIFilter(name: "CILightenBlendMode")!, backgroundImage)
    }
}

public struct LinearBurnBlendMode: CompositeFilterable {
    
    public let compositeOperator: CompositeOperator
    
    public init(backgroundImage: CIImage) {
        self.compositeOperator = CompositeOperator.init(filter: CIFilter(name: "CILinearBurnBlendMode")!, backgroundImage)
    }
}

public struct LinearDodgeBlendMode: CompositeFilterable {
    
    public let compositeOperator: CompositeOperator
    
    public init(backgroundImage: CIImage) {
        self.compositeOperator = CompositeOperator.init(filter: CIFilter(name: "CILinearDodgeBlendMode")!, backgroundImage)
    }
}

public struct OverlayBlendMode: CompositeFilterable {
    
    public let compositeOperator: CompositeOperator
    
    public init(backgroundImage: CIImage) {
        self.compositeOperator = CompositeOperator.init(filter: CIFilter(name: "CIOverlayBlendMode")!, backgroundImage)
    }
}

public struct ScreenBlendMode: CompositeFilterable {
    
    public let compositeOperator: CompositeOperator
    
    public init(backgroundImage: CIImage) {
        self.compositeOperator = CompositeOperator.init(filter: CIFilter(name: "CIScreenBlendMode")!, backgroundImage)
    }
}

public struct SourceAtopCompositing: CompositeFilterable {
    
    public let compositeOperator: CompositeOperator
    
    public init(backgroundImage: CIImage) {
        self.compositeOperator = CompositeOperator.init(filter: CIFilter(name: "CISourceAtopCompositing")!, backgroundImage)
    }
}

public struct SourceOverCompositing: CompositeFilterable {
    
    public let compositeOperator: CompositeOperator
    
    public init(backgroundImage: CIImage) {
        self.compositeOperator = CompositeOperator.init(filter: CIFilter(name: "CISourceOverCompositing")!, backgroundImage)
    }
}
