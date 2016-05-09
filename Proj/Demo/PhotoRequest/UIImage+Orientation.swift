//
//  UIImage+Orientation.swift
//  PhotoRequest
//
//  Created by xxxAIRINxxx on 2016/04/17.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    public func fixOrientation() -> UIImage {
        if self.imageOrientation == .Up { return self }
        
        var transform = CGAffineTransformIdentity
        
        switch (self.imageOrientation) {
        case .Down, .DownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height)
            transform = CGAffineTransformRotate(transform, CGFloat(M_PI))
        case .Left, .LeftMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0)
            transform = CGAffineTransformRotate(transform, CGFloat(M_PI_2))
        case .Right, .RightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, self.size.height)
            transform = CGAffineTransformRotate(transform, CGFloat(-M_PI_2))
        case .Up, .UpMirrored:
            break
        }
        
        switch (self.imageOrientation) {
        case .UpMirrored, .DownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0)
            transform = CGAffineTransformScale(transform, -1, 1)
        case .LeftMirrored, .RightMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.height, 0)
            transform = CGAffineTransformScale(transform, -1, 1)
        case .Up, .Down, .Left, .Right:
            break
        }
        
        let width = Int(self.size.width)
        let height = Int(self.size.height)
        let ctx = CGBitmapContextCreate(
            nil,
            width,
            height,
            CGImageGetBitsPerComponent(self.CGImage),
            0,
            CGImageGetColorSpace(self.CGImage),
            CGImageGetBitmapInfo(self.CGImage).rawValue
        )
        
        CGContextConcatCTM(ctx, transform)
        switch (self.imageOrientation) {
        case .Left, .LeftMirrored, .Right, .RightMirrored:
            CGContextDrawImage(ctx, CGRectMake(0, 0, self.size.height, self.size.width), self.CGImage)
        default:
            CGContextDrawImage(ctx, CGRectMake(0, 0, self.size.width, self.size.height), self.CGImage)
        }
        
        let cgimg = CGBitmapContextCreateImage(ctx)
        let image = UIImage(CGImage: cgimg!)
        
        return image
    }
}
