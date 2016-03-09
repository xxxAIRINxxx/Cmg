//
//  UIImage+CmgFilterChain.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/24.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

// MARK: - Filter Chain Support

/** 
    example

    let filteredImage = image.cmg_chain([
        ComicEffect(),
        GaussianBlur().configuration({ filter in
            filter.inputRadius.setValue(15)
        }),
        PerspectiveTile(imageSize: FilterGenerator.originalImage.size).configuration({ filter in
            filter.inputTopLeft.setVector(Vector2(x: 118.0, y: 490.0).ciVector)
        }),
    ])
*/

extension Filterable {
    
    public func configuration(@noescape configurationBlock: (Self -> Void)) -> Self {
        configurationBlock(self)
        return self
    }
}

extension UIImage {
    
    public func cmg_chain(filters: [Filterable]) -> UIImage? {
        return filters.reduce(self) { return $0.1.processing($0.0) ?? $0.0 }
    }
}
