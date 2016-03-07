//
//  ScalarInput.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

public final class ScalarInput: FilterInputable {
    
    public let key: String
    public let range: Range
    public private(set) var value: Float
    
    public init(filter: CIFilter, key: String, _ defaultValue: Float? = nil) {
        self.key = key
        let range = Range.generateFromFilterAttributes(key, filter: filter)
        self.range = range
        self.value = defaultValue ?? range.initialValue
    }
    
    public func sliders() -> [Slider] {
        return [
          Slider(self.key, self.range) { [weak self] value in
                self?.setValue(value)
            }
        ]
    }
    
    public func setInput(filter: CIFilter) {
        filter.setValue(self.value, forKey: self.key)
    }
    
    public func setValue(value: Float) {
        self.value = self.range.convertValue(value)
    }
    
    public func resetValue() {
        self.value = self.range.initialValue
    }
}