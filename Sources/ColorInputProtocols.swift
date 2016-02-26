//
//  inputColorProtocols.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/19.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

// MARK: - Color

public protocol InputColorAvailable {
    
    var inputColor: ColorInput { get }
}

extension InputColorAvailable {
    
    public var red: CGFloat {
        get { return inputColor.red }
        set { inputColor.setRed(newValue) }
    }
    public var green: CGFloat {
        get { return inputColor.green }
        set { inputColor.setGreen(newValue) }
    }
    public var blue: CGFloat {
        get { return inputColor.blue }
        set { inputColor.setBlue(newValue) }
    }
    public var alpha: CGFloat {
        get { return inputColor.alpha }
        set { inputColor.setAlpha(newValue) }
    }
    
    public var color: UIColor {
        get { return inputColor.rgbaCcolor }
        set { inputColor.setColor(newValue) }
    }
}

// MARK: - Color0

public protocol InputColor0Available {
    
    var inputColor0: ColorInput { get }
}

extension InputColor0Available {
    
    public var red_0: CGFloat {
        get { return inputColor0.red }
        set { inputColor0.setRed(newValue) }
    }
    public var green_0: CGFloat {
        get { return inputColor0.green }
        set { inputColor0.setGreen(newValue) }
    }
    public var blue_0: CGFloat {
        get { return inputColor0.blue }
        set { inputColor0.setBlue(newValue) }
    }
    public var alpha_0: CGFloat {
        get { return inputColor0.alpha }
        set { inputColor0.setAlpha(newValue) }
    }
    
    public var color_0: UIColor {
        get { return inputColor0.rgbaCcolor }
        set { inputColor0.setColor(newValue) }
    }
}

// MARK: - Color1

public protocol InputColor1Available {
    
    var inputColor1: ColorInput { get }
}

extension InputColor1Available {
    
    public var red_1: CGFloat {
        get { return inputColor1.red }
        set { inputColor1.setRed(newValue) }
    }
    public var green_1: CGFloat {
        get { return inputColor1.green }
        set { inputColor1.setGreen(newValue) }
    }
    public var blue_1: CGFloat {
        get { return inputColor1.blue }
        set { inputColor1.setBlue(newValue) }
    }
    public var alpha_1: CGFloat {
        get { return inputColor1.alpha }
        set { inputColor1.setAlpha(newValue) }
    }
    
    public var color_1: UIColor {
        get { return inputColor1.rgbaCcolor }
        set { inputColor1.setColor(newValue) }
    }
}

