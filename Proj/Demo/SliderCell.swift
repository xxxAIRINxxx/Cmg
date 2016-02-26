//
//  SliderCell.swift
//  Demo
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import Cmg

final class SliderCell: UITableViewCell {
    
    var upsdateSliderHandler: (Float -> Void)?
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.label.adjustsFontSizeToFitWidth = true
    }
}

// MARK: - User Interaction

extension SliderCell {
    
    @IBAction private func changeSliderValue(sender: UISlider) {
        self.valueLabel.text = sender.value.description
        self.upsdateSliderHandler?(sender.value)
    }
}
