//
//  AffineTransformInputProtocols.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/24.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

public protocol InputAffineTransformAvailable {
    
    var inputTransform: AffineTransformInput { get }
}

extension InputAffineTransformAvailable {
    
    public var transform: CGAffineTransform {
        get { return inputTransform.value }
        set { inputTransform.value = newValue }
    }
    
    public func setTranslate(x: CGFloat, _ y: CGFloat) {
        inputTransform.value = CGAffineTransformTranslate(inputTransform.value, x, y)
    }
    
    public func setScale(x: CGFloat, _ y: CGFloat) {
        inputTransform.value = CGAffineTransformScale(inputTransform.value, x, y)
    }
    
    public func setRotate(angle: CGFloat) {
        inputTransform.value = CGAffineTransformRotate(inputTransform.value, angle)
    }
    
    public func invert() {
        inputTransform.value = CGAffineTransformInvert(inputTransform.value)
    }
    
    public func concat(transform: CGAffineTransform) {
        inputTransform.value = CGAffineTransformConcat(inputTransform.value, transform)
    }
}
