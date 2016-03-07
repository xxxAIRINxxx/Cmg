//
//  BooleanInput.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/24.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

public final class BooleanInput: FilterInputable {
    
    public let key: String
    public var value: Bool
    
    private let initialValue: Bool
    
    public init(filter: CIFilter, key: String) {
        self.key = key
        let attributes = filter.attributes[key] as? [String : AnyObject]
        let _value = attributes?["CIAttributeDefault"] as? NSNumber ?? NSNumber(bool: true)
        self.value = _value.boolValue
        self.initialValue = self.value
    }
    
    public func sliders() -> [Slider] {
        return []
    }
    
    public func setInput(filter: CIFilter) {
        filter.setValue(self.value, forKey: self.key)
    }
    
    public func resetValue() {
        self.value = self.initialValue
    }
}