//
//  Cmg.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

// MARK: - Processable

public protocol Processable {
    
    var name: String { get }
    
    func processing(uiImage: UIImage) -> UIImage?
    func processing(ciImage: CIImage?) -> CIImage?
    func processingIntoCIImage(uiImage: UIImage) -> CIImage?
    
    // slider support
    func sliders() -> [Slider]
}

extension Processable {
    
    public func processing(uiImage: UIImage) -> UIImage? {
        let ciImage = CIImage.generate(uiImage)
        return self.processing(ciImage)?.generateUIImage(uiImage)
    }
    
    public func processingIntoCIImage(uiImage: UIImage) -> CIImage? {
        let ciImage = CIImage.generate(uiImage)
        return self.processing(ciImage)
    }
    
    public func sliders() -> [Slider] { return [] }
    
    public func resetSilderValues() {
        self.sliders().forEach() { $0.resetValue() }
    }
}

// MARK: - Filterable

public protocol Filterable: Processable {
    
    var filter: CIFilter { get }
    
    func setupFilter()
}

extension Filterable {
    
    public var name: String { return self.filter.name }
    
    public func processing(ciImage: CIImage?) -> CIImage? {
        guard let _ciImage = ciImage else { return nil }
        
        self.filter.setDefaults()
        self.filter.setValue(_ciImage, forKey: kCIInputImageKey)
        self.setupFilter()
        let outputImage = self.filter.outputImage
        
        return outputImage
    }
    
    public func setupFilter() {}
}

// MARK: - FilterInputable

public protocol FilterInputable {
    
    func sliders() -> [Slider]
    
    func setInput(filter: CIFilter)
    
    func resetValue()
}

// MARK: - FilterInputCollectionType

public protocol FilterInputCollectionType {
    
    func inputs() -> [FilterInputable]
}

extension FilterInputCollectionType {
    
    public func resetSilderValues() {
        self.inputs().forEach() { $0.resetValue() }
    }
}

extension Filterable where Self: FilterInputCollectionType {
    
    public func sliders() -> [Slider] {
        let value: [Slider] = []
        return self.inputs().reduce(value) { $0.0 + $0.1.sliders() }
    }
    
    public func setupFilter() {
        self.inputs().forEach() { $0.setInput(self.filter) }
    }
}

// MARK: - InputImageUnusable

public protocol InputImageUnusable: Filterable {}

extension InputImageUnusable {
    
    public func processing() -> UIImage? {
        return self.processing(ciImage: nil)?.generateUIImage()
    }
    
    public func processing(uiImage: UIImage) -> UIImage? {
        return self.processing(ciImage: nil)?.generateUIImage(uiImage)
    }
    
    public func processing(ciImage ciImage: CIImage?) -> CIImage? {
        self.filter.setDefaults()
        self.setupFilter()
        let outputImage = self.filter.outputImage
        
        return outputImage
    }
}

