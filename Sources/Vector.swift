//
//  Vector.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

public protocol Vectorable {
    
    var ciVector: CIVector { get }
}

public struct Vector2: Vectorable {
    public var x: CGFloat
    public var y: CGFloat
    
    public init(size: CGSize) {
        self.x = size.width
        self.y = size.height
    }
    
    public init(x: CGFloat, y: CGFloat) {
        self.x = x
        self.y = y
    }
    
    public init(values: [CGFloat]) {
        self.x = values.count >= 2 ? values[0] : 0.0
        self.y = values.count >= 2 ? values[1] : 0.0
    }
    
    public var ciVector: CIVector { return CIVector(x: x, y: y) }
}

public struct Vector4: Vectorable {
    public var x: CGFloat
    public var y: CGFloat
    public var z: CGFloat
    public var w: CGFloat
    
    public init(x: CGFloat, y: CGFloat, z: CGFloat, w: CGFloat) {
        self.x = x
        self.y = y
        self.z = z
        self.w = z
    }
    
    public init(size: CGSize) {
        self.x = 0.0
        self.y = 0.0
        self.z = size.width
        self.w = size.height
    }
    
    public init(rect: CGRect) {
        self.x = rect.origin.x
        self.y = rect.origin.y
        self.z = rect.size.width
        self.w = rect.size.height
    }
    
    public init(values: [CGFloat]) {
        self.x = values.count >= 4 ? values[0] : 0.0
        self.y = values.count >= 4 ? values[1] : 0.0
        self.z = values.count >= 4 ? values[2] : 0.0
        self.w = values.count >= 4 ? values[3] : 0.0
    }
    
    public var ciVector: CIVector { return CIVector(x: x, y: y, z: z, w: w) }
}

public struct VectorAny: Vectorable {
    public let count: Int
    public private(set) var values: [CGFloat] = []
    
    public init(count: Int, values: [CGFloat]) {
        self.count = count
        
        for index in 0..<count {
            if values.count <= index {
                self.values.append(0.0)
            } else {
                self.values.append(values[index])
            }
        }
    }
    
    public var ciVector: CIVector {
        return CIVector(values: self.values, count: self.count)
    }
}
