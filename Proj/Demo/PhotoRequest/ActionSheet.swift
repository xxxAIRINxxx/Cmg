//
//  ActionSheet.swift
//  PhotoRequest
//
//  Created by xxxAIRINxxx on 2016/04/17.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import UIKit

public typealias ActionSheetCompletion = (Void -> Void)

private struct ActionInfo {
    
    let type : UIAlertActionStyle
    let title : String
    let completion : ActionSheetCompletion?
    
    init(_ type: UIAlertActionStyle, _ title: String,  _ completion: ActionSheetCompletion?) {
        self.type = type
        self.title = title
        self.completion = completion
    }
}

public final class ActionSheet {
    
    let title : String
    let message : String
    
    private var actionInfo : [ActionInfo] = []
    private var cancelInfo : ActionInfo?
    
    // MARK: - Initializer
    
    public init(title: String, message: String? = nil) {
        self.title = title
        self.message = message ?? ""
    }
    
    // MARK: - Instance Functions
    
    public func setCancelAction(title: String, completion: ActionSheetCompletion? = nil) -> ActionSheet {
        self.cancelInfo = ActionInfo(.Cancel, title, completion)
        return self
    }
    
    public func addAction(title: String, completion: ActionSheetCompletion?) -> ActionSheet {
        let a = ActionInfo(.Default, title, completion)
        self.actionInfo.append(a)
        return self
    }
    
    public func addDestructiveAction(title: String, completion: ActionSheetCompletion?) -> ActionSheet {
        let a = ActionInfo(.Destructive, title, completion)
        self.actionInfo.append(a)
        return self
    }
    
    public func show(owner: UIViewController) {
        let alertController = UIAlertController(title: self.title, message: self.message, preferredStyle: .ActionSheet)
        
        if let _cancelInfo = self.cancelInfo {
            self.actionInfo.append(_cancelInfo)
            self.cancelInfo = nil
        }
        
        self.actionInfo.forEach() { info in
            let action = UIAlertAction(title: info.title, style: info.type) { _ in
                info.completion?()
            }
            alertController.addAction(action)
        }
        
        if self.actionInfo.count == 0 {
            let action = UIAlertAction(title: "Cancel", style: .Default) { _ in }
            alertController.addAction(action)
        }
        
        owner.presentViewController(alertController, animated: true, completion: nil)
    }
}
