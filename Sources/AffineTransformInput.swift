//
//  AffineTransformInput.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/22.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

public final class AffineTransformInput: FilterInputable {
    
    public var value: CGAffineTransform
    
    private let initialValue: CGAffineTransform
    
    public init() {
        self.value = CGAffineTransformIdentity
        self.value.a = 1.0
        self.value.d = 1.0
        
        self.initialValue = self.value
    }
    
    public func sliderRanges() -> [Slider] {
        return []
    }
    
    public func setInput(filter: CIFilter) {
        filter.setValue(NSValue(CGAffineTransform: self.value), forKey: kCIInputTransformKey)
    }
    
    public func resetValue() {
        self.value = self.initialValue
    }
}