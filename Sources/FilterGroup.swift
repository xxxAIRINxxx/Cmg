//
//  FilterGroup.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

/**
    example
 
    let filterGroup = FilterGroup(name: "FilterGroupExample", [
        BoxBlur().configuration({ filter in
            filter.inputRadius.setValue(15)
        }),
        Vignette(),
        PhotoEffectMono(),
        ]
    )
 
    let filteredImage = filterGroup.processing(image)
*/

public struct FilterGroup: Processable {
    
    public let name: String
    fileprivate var filters: [Filterable]
    
    public init(name: String? = nil, _ filters : [Filterable] = []) {
        self.name = name ?? "FilterGroup"
        self.filters = filters
    }
    
    mutating func append(_ filter: Filterable) {
        self.filters.append(filter)
    }
    
    public func sliders() -> [Slider] {
        let sliderRanges: [Slider] = []
        
        return self.filters.reduce(sliderRanges) { result, slider in
            return result + slider.sliders()
        }
    }
    
    public func processing(_ ciImage: CIImage?) -> CIImage? {
        return self.filters.reduce(ciImage) { return $0.1.processing($0.0) }
    }
}
