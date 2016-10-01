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
    
    static func generate(_ uiImage: UIImage) -> CIImage? {
        var ciImage: CIImage? = uiImage.ciImage
        if ciImage == nil {
            guard let _cgImage = uiImage.cgImage else { return nil }
            ciImage = CIImage(cgImage: _cgImage)
        }
        return ciImage
    }
    
    func generateUIImage() -> UIImage {
        let cgImage = Context.ciContext.createCGImage(self, from: self.extent)
        
        return UIImage(cgImage: cgImage!, scale: UIScreen.main.scale, orientation: .up)
    }
    
    func generateUIImage(_ originalImage: UIImage) -> UIImage {
        var extent = self.extent
        if extent.origin.x < 0.0 || extent.origin.y < 0.0 {
            extent = CGRect(x: 0, y: 0, width: originalImage.size.width, height: originalImage.size.height)
        }
        let cgImage = Context.ciContext.createCGImage(self, from: extent)
        
        return UIImage(cgImage: cgImage!, scale: originalImage.scale, orientation: originalImage.imageOrientation)
    }
}
