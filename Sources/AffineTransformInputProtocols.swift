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
    
    public func setTranslate(_ x: CGFloat, _ y: CGFloat) {
        inputTransform.value = inputTransform.value.translatedBy(x: x, y: y)
    }
    
    public func setScale(_ x: CGFloat, _ y: CGFloat) {
        inputTransform.value = inputTransform.value.scaledBy(x: x, y: y)
    }
    
    public func setRotate(_ angle: CGFloat) {
        inputTransform.value = inputTransform.value.rotated(by: angle)
    }
    
    public func invert() {
        inputTransform.value = inputTransform.value.inverted()
    }
    
    public func concat(_ transform: CGAffineTransform) {
        inputTransform.value = inputTransform.value.concatenating(transform)
    }
}
