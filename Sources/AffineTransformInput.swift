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
    
    fileprivate let initialValue: CGAffineTransform
    
    public init() {
        self.value = CGAffineTransform.identity
        self.value.a = 1.0
        self.value.d = 1.0
        
        self.initialValue = self.value
    }
    
    public func sliders() -> [Slider] {
        return []
    }
    
    public func setInput(_ filter: CIFilter) {
        filter.setValue(NSValue(cgAffineTransform: self.value), forKey: kCIInputTransformKey)
    }
    
    public func resetValue() {
        self.value = self.initialValue
    }
}
