//
//  Slider.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation

public class Slider {
    
    public var name: String
    public let range: Range
    
    private let bindHandler: (Float -> Void)
    
    public var currentValue: Float {
        didSet {
            self.bindHandler(self.range.convertValue(self.currentValue))
        }
    }
    
    public init(_ name: String, _ range: Range, _ handler: (Float -> Void)) {
        self.name = name
        self.range = range
        self.bindHandler = handler
        self.currentValue = range.initialValue
    }
    
    public func resetValue() {
        self.currentValue = self.range.initialValue
    }
}
