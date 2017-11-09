//
//  SliderTableView.swift
//  Demo
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import Cmg

final class SliderTableView: UITableView {
    
    var upsdateSliderHandler: (() -> Void)?
    
    fileprivate var sliders: [Slider] = []

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    fileprivate func commonInit() {
        self.register(UINib(nibName: "SliderCell", bundle: nil), forCellReuseIdentifier: "SliderCell")
        self.dataSource = self
        self.delegate = self
    }
    
    func updateSliders(_ filter: PhotoProcessable) {
        self.sliders = filter.sliders
        self.reloadData()
    }
}

extension SliderTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sliders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SliderCell", for: indexPath) as! SliderCell
        
        let slider = self.sliders[(indexPath as NSIndexPath).row]
        
        cell.label.text = slider.name
        cell.valueLabel.text = slider.currentValue.description
        cell.slider.maximumValue = slider.range.maximumValue
        cell.slider.minimumValue = slider.range.minimumValue
        cell.slider.value = slider.currentValue
        cell.upsdateSliderHandler = { [weak self] value in
          slider.currentValue = value
            self?.upsdateSliderHandler?()
        }
        
        return cell
    }
}

extension SliderTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
