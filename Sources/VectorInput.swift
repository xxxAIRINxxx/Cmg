//
//  VectorInput.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

public enum VectorType {
    case position(maximumSize: Vector2)
    case extent(extent: Vector4)
    case color
    case colorOffset
    case other(count: Int)
}

public final class VectorInput: FilterInputable {
    public let type: VectorType
    public let key: String
    
    public fileprivate(set) var values: [CGFloat] = []
    public fileprivate(set) var ranges: [Range] = []
    
    fileprivate var initialValue: CIVector?
    
    init(_ type: VectorType, _ filter: CIFilter, _ key: String) {
        self.type = type
        self.key = key
        
        let attributes = filter.attributes[key] as? [String : AnyObject]
        let vector = attributes?[kCIAttributeDefault] as? CIVector
        
        if let _vector = vector {
            self.setVector(_vector)
            self.initialValue = _vector
        }
    }
    
    public func setVector(_ vector: CIVector) {
        self.values.removeAll()
        self.ranges.removeAll()
        
        for i in 0..<vector.count {
            let v: CGFloat = vector.value(at: i)
            self.values.append(v)
            
            switch type {
            case .position(let maximumSize):
                switch i {
                case 0: self.ranges.append(Range(0.0, Float(maximumSize.x), Float(v)))
                case 1: self.ranges.append(Range(0.0, Float(maximumSize.y), Float(v)))
                default: break
                }
            case .extent(let extent):
                switch i {
                case 0: self.ranges.append(Range(0.0, Float(extent.z), Float(v)))
                case 1: self.ranges.append(Range(0.0, Float(extent.w), Float(v)))
                case 2: self.ranges.append(Range(0.0, Float(extent.z), Float(v)))
                case 3: self.ranges.append(Range(0.0, Float(extent.w), Float(v)))
                default: break
                }
            case .color:
                self.ranges.append(Range(0.0, 1.0, Float(v)))
            case .colorOffset:
                self.ranges.append(Range(0.0, 1.0, Float(v)))
            case .other:
                self.ranges.append(Range(0.0, 1.0, Float(v)))
            }
        }
    }
    
    internal func setValue(_ index: Int, value: CGFloat) {
        self.values[index] = value
    }
    
    public func sliders() -> [Slider] {
        var names: [String]
        switch type {
        case .position(_):
            names = ["\(self.key) x", "\(self.key) y"]
        case .extent(_):
            names = ["\(self.key) x", "\(self.key) y", "\(self.key) z" , "\(self.key) w"]
        case .color:
            names = ["\(self.key) red", "\(self.key) green", "\(self.key) blue", "\(self.key) alpha"]
        case .colorOffset:
            names = ["\(self.key) x", "\(self.key) y"]
        case .other:
            names = []
            self.values.enumerated().forEach() {
                names.append("\(self.key) \($0.0)")
            }
        }
        return []
//        return self.values.enumerated().map { i in
//            return Slider(names[i.1], self.ranges[i.0]) { [weak self] value in
//                self?.setValue(i.index, value: CGFloat(value))
//            }
//        }
    }
    
    public func setInput(_ filter: CIFilter) {
        filter.setValue(CIVector(values: self.values, count: self.values.count), forKey: self.key)
    }
    
    public func resetValue() {
        guard let _initialValue = self.initialValue else { return }
        self.setVector(_initialValue)
    }
}

extension VectorInput {
    
    public var vector2: Vector2 {
        get { return Vector2(values: self.values) }
    }
    
    public var vector4: Vector4 {
        get { return Vector4(values: self.values) }
    }
    
    public var vectorAny: VectorAny {
        get { return VectorAny(count: self.values.count, values: self.values) }
    }
}

extension CGSize {
    
    public var vector2 : Vector2 {
        get { return Vector2(size: self) }
    }
    
    public var vector4 : Vector4 {
        get { return Vector4(x: 0, y: 0, z: self.width, w: self.height) }
    }
}

extension CGRect {
    
    public var vector2 : Vector2 {
        get { return Vector2(size: self.size) }
    }
    
    public var vector4 : Vector4 {
        get { return Vector4(rect: self) }
    }
}
