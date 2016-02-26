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
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
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
    
    func setFilter(filter: PhotoProcessable) {
        self.titleLabel.text = filter.name
        self.imageView.image = filter.thumbnailImage
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        if self.isSelectedFilter == false { return }
        
        let lineWidth: CGFloat = 2.0
        
        let bottomLine = UIBezierPath(rect: CGRectMake(0, self.frame.size.height - lineWidth, self.frame.size.width, lineWidth))
        UIColor.blueColor().setStroke()
        bottomLine.lineWidth = lineWidth
        bottomLine.stroke()
    }
}
