//
//  ActionSheet.swift
//  PhotoRequest
//
//  Created by xxxAIRINxxx on 2016/04/17.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import UIKit

public typealias ActionSheetCompletion = ((Void) -> Void)

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
    
    fileprivate var actionInfo : [ActionInfo] = []
    fileprivate var cancelInfo : ActionInfo?
    
    // MARK: - Initializer
    
    public init(title: String, message: String? = nil) {
        self.title = title
        self.message = message ?? ""
    }
    
    // MARK: - Instance Functions
    
    public func setCancelAction(_ title: String, completion: ActionSheetCompletion? = nil) -> ActionSheet {
        self.cancelInfo = ActionInfo(.cancel, title, completion)
        return self
    }
    
    public func addAction(_ title: String, completion: ActionSheetCompletion?) -> ActionSheet {
        let a = ActionInfo(.default, title, completion)
        self.actionInfo.append(a)
        return self
    }
    
    public func addDestructiveAction(_ title: String, completion: ActionSheetCompletion?) -> ActionSheet {
        let a = ActionInfo(.destructive, title, completion)
        self.actionInfo.append(a)
        return self
    }
    
    public func show(_ owner: UIViewController) {
        let alertController = UIAlertController(title: self.title, message: self.message, preferredStyle: .actionSheet)
        
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
            let action = UIAlertAction(title: "Cancel", style: .default) { _ in }
            alertController.addAction(action)
        }
        
        owner.present(alertController, animated: true, completion: nil)
    }
}
