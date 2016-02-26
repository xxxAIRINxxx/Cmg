//
//  StretchImageView.swift
//  Demo
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit

final class StretchImageView: UIView, UIScrollViewDelegate {
    
    private static let maxZoomScale: CGFloat = 3
    
    var image : UIImage? {
        get { return self.imageView.image }
        set {
            let isFirst = self.imageView.image == nil
            self.imageView.image = newValue
            if isFirst == true {
                self.resetZoomScale(false)
            }
        }
    }
    
    private var imageView : UIImageView!
    private var scrollView : UIScrollView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.scrollView.contentSize = self.imageView.frame.size
    }
    
    func addToParentView(parentView: UIView) {
        self.frame = parentView.bounds
        self.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        parentView.addSubview(self)
    }
    
    private func setup() {
        self.scrollView = UIScrollView(frame: self.bounds)
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.delegate = self
        self.scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.scrollView.panGestureRecognizer.delaysTouchesBegan = false
        self.scrollView.panGestureRecognizer.minimumNumberOfTouches = 1
        self.scrollView.bounces = false
        self.addSubview(self.scrollView)
        
        self.imageView = UIImageView(frame: self.bounds)
        self.imageView.userInteractionEnabled = true
        self.imageView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.scrollView.addSubview(self.imageView)
    }
    
    func resetImageViewFrame() {
        let size = (self.imageView.image != nil) ? self.imageView.image!.size : self.imageView.frame.size
        if size.width > 0 && size.height > 0 {
            let ratio = min(self.scrollView.frame.size.width / size.width, self.scrollView.frame.size.height / size.height)
            let W = ratio * size.width * self.scrollView.zoomScale
            let H = ratio * size.height * self.scrollView.zoomScale
            
            self.imageView.frame = CGRectMake(
                max(0, (self.scrollView.frame.size.width - W) / 2),
                max(0, (self.scrollView.frame.size.height - H) / 2), W, H)
        }
    }
    
    func resetZoomScale(animated: Bool) {
        var Rw = self.scrollView.frame.size.width / self.imageView.frame.size.width
        var Rh = self.scrollView.frame.size.height / self.imageView.frame.size.height
        
        let scale: CGFloat = UIScreen.mainScreen().scale
        Rw = max(Rw, self.imageView.image!.size.width / (scale * self.scrollView.frame.size.width))
        Rh = max(Rh, self.imageView.image!.size.height / (scale * self.scrollView.frame.size.height))
        
        self.scrollView.contentSize = self.imageView.frame.size
        self.scrollView.minimumZoomScale = 1
        self.scrollView.maximumZoomScale = max(max(Rw, Rh), StretchImageView.maxZoomScale)
        
        self.scrollView.setZoomScale(self.scrollView.minimumZoomScale, animated: animated)
    }
    
    func reset(animated: Bool) {
        self.resetImageViewFrame()
        self.resetZoomScale(animated)
    }
}

// MARK: - UIScrollViewDelegate

extension StretchImageView {
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        let Ws = self.scrollView.frame.size.width - self.scrollView.contentInset.left - self.scrollView.contentInset.right
        let Hs = self.scrollView.frame.size.height - self.scrollView.contentInset.top - self.scrollView.contentInset.bottom
        let W = self.imageView.frame.size.width
        let H = self.imageView.frame.size.height
        
        var rct = self.imageView.frame
        rct.origin.x = max((Ws-W) / 2, 0)
        rct.origin.y = max((Hs-H) / 2, 0)
        self.imageView.frame = rct
    }
}

