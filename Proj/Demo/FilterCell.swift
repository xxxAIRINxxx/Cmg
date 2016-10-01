//
//  FilterCell.swift
//  Demo
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit

final class FilterCell: UICollectionViewCell {
    
    @IBOutlet fileprivate weak var imageView: UIImageView!
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    
    var isSelectedFilter: Bool = false {
        didSet { self.setNeedsDisplay() }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imageView.layer.cornerRadius = 5.0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.isSelectedFilter = false
    }
    
    func setFilter(_ filter: PhotoProcessable) {
        self.titleLabel.text = filter.name
        self.imageView.image = filter.thumbnailImage
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if self.isSelectedFilter == false { return }
        
        let lineWidth: CGFloat = 2.0
        
        let bottomLine = UIBezierPath(rect: CGRect(x: 0, y: self.frame.size.height - lineWidth, width: self.frame.size.width, height: lineWidth))
        UIColor.blue.setStroke()
        bottomLine.lineWidth = lineWidth
        bottomLine.stroke()
    }
}
