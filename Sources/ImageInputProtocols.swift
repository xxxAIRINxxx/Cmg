//
//  ImageInputProtocols.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/19.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

// MARK: - Image

public protocol InputImageAvailable {
    
    var inputImage: ImageInput { get }
}

extension InputImageAvailable {
    
    public var alpha_image: CGFloat {
        get { return inputImage.alpha }
        set { inputImage.updateAlpha(newValue) }
    }
}

// MARK: - BackgroundImage

public protocol InputBackgroundImageAvailable {
    
    var inputBackgroundImage: ImageInput { get }
}

extension InputBackgroundImageAvailable {
    
    public var alpha_background: CGFloat {
        get { return inputBackgroundImage.alpha }
        set { inputBackgroundImage.updateAlpha(newValue) }
    }
}

// MARK: - MaskImage

public protocol InputMaskImageAvailable {
    
    var inputMaskImage: ImageInput { get }
}

extension InputMaskImageAvailable {
    
    public var alpha_mask: CGFloat {
        get { return inputMaskImage.alpha }
        set { inputMaskImage.updateAlpha(newValue) }
    }
}

// MARK: - DisplacementImage

public protocol InputDisplacementImageAvailable {
    
    var inputDisplacementImage: ImageInput { get }
}

extension InputDisplacementImageAvailable {
    
    public var alpha_displacement: CGFloat {
        get { return inputDisplacementImage.alpha }
        set { inputDisplacementImage.updateAlpha(newValue) }
    }
}


// MARK: - Texture

public protocol InputTextureAvailable {
    
    var inputTexture: ImageInput { get }
}

extension InputTextureAvailable {
    
    public var alpha_texture: CGFloat {
        get { return inputTexture.alpha }
        set { inputTexture.updateAlpha(newValue) }
    }
}

// MARK: - Shading Image

public protocol InputShadingImageAvailable {
    
    var inputShadingImage: ImageInput { get }
}

extension InputShadingImageAvailable {
    
    public var alpha_shadingImage: CGFloat {
        get { return inputShadingImage.alpha }
        set { inputShadingImage.updateAlpha(newValue) }
    }
}