//
//  UIImage+CmgShorthand.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/24.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

extension UIImage {
    
    // MARK: - Blur
    
    @available(iOS 9.0, *)
    public func cmg_boxBlur(_ radius: Float = 10) -> UIImage? {
        var filter = BoxBlur()
        filter.radius = radius
        return filter.processing(self)
    }
    
    public func cmg_gaussianBlur(_ radius: Float = 10) -> UIImage? {
        var filter = GaussianBlur()
        filter.radius = radius
        return filter.processing(self)
    }
    
    @available(iOS 9.0, *)
    public func cmg_median() -> UIImage? {
        return Median().processing(self)
    }
    
    // Geometry Adjustment
    
    public func cmg_resize(_ newSize: CGSize) -> UIImage? {
        let scale = CGPoint(x: newSize.width / self.size.width, y: newSize.height / self.size.height)
        let bounds = CGRect(origin: CGPoint.zero, size: newSize)
        
        let filter = AffineTransform()
        filter.setScale(scale.x, scale.y)
        return filter.processingIntoCIImage(self)?.cropped(to: bounds).generateUIImage(self)
    }
    
    public func cmg_resizeAtAspectFit(_ newSize: CGSize) -> UIImage? {
        var destWidth: CGFloat = newSize.width
        var destHeight: CGFloat = newSize.height
        
        if self.size.width > self.size.height {
            destHeight = (self.size.height * newSize.width / self.size.width)
        } else {
            destWidth = (self.size.width * newSize.height / self.size.height)
        }
        
        if destWidth > newSize.width {
            destWidth = newSize.width
            destHeight = (self.size.height * newSize.width / self.size.width)
        }
        if (destHeight > newSize.height) {
            destHeight = newSize.height
            destWidth = (self.size.width * newSize.height / self.size.height)
        }
        return self.cmg_resize(CGSize(width: destWidth, height: destHeight))
    }
    
    public func cmg_resizeAtAspectFill(_ newSize: CGSize) -> UIImage? {
        var destWidth: CGFloat = newSize.width
        var destHeight: CGFloat = newSize.height
        let widthRatio = newSize.width / self.size.width
        let heightRatio = newSize.height / self.size.height
        
        if heightRatio > widthRatio {
            destHeight = newSize.height
            destWidth = (self.size.width * newSize.height / self.size.height)
        } else {
            destWidth = newSize.width;
            destHeight = (self.size.height * newSize.width / self.size.width)
        }
        return self.cmg_resize(CGSize(width: destWidth, height: destHeight))
    }
}

