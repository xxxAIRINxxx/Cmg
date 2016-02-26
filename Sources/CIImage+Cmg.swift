//
//  CIImage+Convert.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

extension CIImage {
    
    static func generate(uiImage: UIImage) -> CIImage? {
        var ciImage: CIImage? = uiImage.CIImage
        if ciImage == nil {
            guard let _cgImage = uiImage.CGImage else { return nil }
            ciImage = CIImage(CGImage: _cgImage)
        }
        return ciImage
    }
    
    func generateUIImage() -> UIImage {
        let cgImage = Context.ciContext.createCGImage(self, fromRect: self.extent)
        
        return UIImage(CGImage: cgImage, scale: UIScreen.mainScreen().scale, orientation: .Up)
    }
    
    func generateUIImage(originalImage: UIImage) -> UIImage {
        var extent = self.extent
        if extent.origin.x < 0.0 || extent.origin.y < 0.0 {
            extent = CGRect(x: 0, y: 0, width: originalImage.size.width, height: originalImage.size.height)
        }
        let cgImage = Context.ciContext.createCGImage(self, fromRect: extent)
        
        return UIImage(CGImage: cgImage, scale: originalImage.scale, orientation: originalImage.imageOrientation)
    }
}