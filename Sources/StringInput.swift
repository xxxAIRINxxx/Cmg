//
//  StringInput.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

public final class StringInput: FilterInputable {
    
    public let key: String
    public var value: String
    public let needDataEncode: Bool
    public let encoding: UInt
    
    fileprivate let initialValue: String
    
    public init(filter: CIFilter,
        key: String,
        _ value: String? = nil,
        _ needDataEncode: Bool = true,
        _ encoding: UInt = String.Encoding.unicode.rawValue) {
            self.key = key
            if let _value = value {
                self.value = _value
            } else {
                let attributes = filter.attributes[key] as? [String : AnyObject]
                self.value = attributes?["CIAttributeDefault"] as? String ?? ""
            }
            self.needDataEncode = needDataEncode
            self.encoding = encoding
            self.initialValue = self.value
    }
    
    public func sliders() -> [Slider] {
        return []
    }
    
    public func setInput(_ filter: CIFilter) {
        if self.needDataEncode {
            filter.setValue(self.value.data(using: String.Encoding(rawValue: self.encoding)), forKey: self.key)
        } else {
            filter.setValue(self.value, forKey: self.key)
        }
    }
    
    public func resetValue() {
        self.value = self.initialValue
    }
}
