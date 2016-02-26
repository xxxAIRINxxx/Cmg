//
//  BooleanInputProtocols.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/24.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

// MARK: - CompactStyle

public protocol InputCompactStyleAvailable {
    
    var inputCompactStyle: BooleanInput { get }
}

extension InputCompactStyleAvailable {
    
    public var compactStyle: Bool {
        get { return inputCompactStyle.value }
        set { inputCompactStyle.value = newValue }
    }
}