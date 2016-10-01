//
//  Slider.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation

open class Slider {
    
    open var name: String
    open let range: Range
    
    fileprivate let bindHandler: ((Float) -> Void)
    
    open var currentValue: Float {
        didSet {
            self.bindHandler(self.range.convertValue(self.currentValue))
        }
    }
    
    public init(_ name: String, _ range: Range, _ handler: @escaping ((Float) -> Void)) {
        self.name = name
        self.range = range
        self.bindHandler = handler
        self.currentValue = range.initialValue
    }
    
    open func resetValue() {
        self.currentValue = self.range.initialValue
    }
}
