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
    
    public static var shared = Context()
    
    public static var egleContext : EAGLContext { return Context.shared.egleContext ?? Context.shared.defaultEgleContext }
    public static var ciContext : CIContext { return Context.shared.ciContext ?? Context.shared.defaultCIContext }
    
    public let defaultEgleContext : EAGLContext
    public let defaultCIContext : CIContext
    
    public var egleContext : EAGLContext?
    public var ciContext : CIContext?
    
    private init() {
        self.defaultEgleContext = EAGLContext(API: .OpenGLES2)
        
        #if (arch(i386) || arch(x86_64)) && os(iOS)
            self.defaultCIContext = CIContext(options: [
                kCIContextUseSoftwareRenderer: true,
                kCIContextPriorityRequestLow: true,
                kCIContextOutputColorSpace: NSNull()
                ])
        #else
            self.defaultCIContext = CIContext(EAGLContext: self.defaultEgleContext, options: [kCIContextUseSoftwareRenderer: false])
        #endif
    }
}
