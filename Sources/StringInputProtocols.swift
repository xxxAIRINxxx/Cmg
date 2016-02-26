//
//  StringInputProtocols.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/24.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

// MARK: - Message

public protocol InputMessageAvailable {
    
    var inputMessage: StringInput { get }
}

extension InputMessageAvailable {
    
    public var message: String {
        get { return inputMessage.value }
        set { inputMessage.value = newValue }
    }
}

// MARK: - Correction Level

public protocol InputStringCorrectionLevelAvailable {
    
    var inputStringCorrectionLevel: StringInput { get }
}

extension InputStringCorrectionLevelAvailable {
    
    public var correctionLevel: String {
        get { return inputStringCorrectionLevel.value }
        set { inputStringCorrectionLevel.value = newValue }
    }
}

