//
//  Context.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

public final class Context {
    
    public static let shared = Context()
    
    public static var egleContext : EAGLContext { return Context.shared.egleContext ?? Context.shared.defaultEgleContext }
    public static var ciContext : CIContext { return Context.shared.ciContext ?? Context.shared.defaultCIContext }
    
    public static var options: [String : Any] {
        #if (arch(i386) || arch(x86_64)) && os(iOS)
            return [
                kCIContextPriorityRequestLow : true,
                kCIContextWorkingColorSpace : NSNull(),
                kCIContextPriorityRequestLow: true
            ]
        #else
            return [
                kCIContextUseSoftwareRenderer : false,
                kCIContextWorkingColorSpace : NSNull()
            ]
        #endif
    }
    
    public let defaultEgleContext : EAGLContext
    public let defaultCIContext : CIContext
    
    public var egleContext : EAGLContext?
    public var ciContext : CIContext?
    
    fileprivate init() {
        self.defaultEgleContext = EAGLContext(api: .openGLES2)!
        self.defaultCIContext = CIContext(eaglContext: self.defaultEgleContext, options: Context.options)
    }
}
