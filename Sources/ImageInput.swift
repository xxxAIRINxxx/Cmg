//
//  ImageInput.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

public final class ImageInput: FilterInputable {
    
    public let key: String
    public let range: Range
    public let image: CIImage
    
    public fileprivate(set) var alpha: CGFloat = 1.0
    
    public init(image: CIImage, key: String) {
        self.key = key
        self.image = image
        self.range = Range(0.0, 1.0, 1.0)
    }
    
    public func sliders() -> [Slider] {
        let value: [Slider] = [Slider(self.key, self.range) { [weak self] value in
            self?.alpha = CGFloat(value)
            }]
        return value
    }
    
    public func setInput(_ filter: CIFilter) {
        var _image = self.image
        
        if self.alpha < 1.0 {
            let alphaFilter = CIFilter(name: "CIColorMatrix")!
            alphaFilter.setValue(self.image, forKey: kCIInputImageKey)
            alphaFilter.setValue(CIVector(x: 0.0, y: 0.0, z: 0.0, w: self.alpha), forKey: "inputAVector")
            _image = alphaFilter.outputImage!
        }
        
        filter.setValue(_image, forKey: self.key)
    }
    
    public func updateAlpha(_ value: CGFloat) {
        self.alpha = CGFloat(self.range.convertValue(Float(value)))
    }
    
    public func resetValue() {
        self.alpha = 1.0
    }
}
