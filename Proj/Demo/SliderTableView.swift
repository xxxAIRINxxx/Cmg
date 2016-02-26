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
    
    var upsdateSliderHandler: (Void -> Void)?
    
    private var sliderRanges: [Slider] = []

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.registerNib(UINib(nibName: "SliderCell", bundle: nil), forCellReuseIdentifier: "SliderCell")
        self.dataSource = self
        self.delegate = self
    }
    
    func updateSliders(filter: PhotoProcessable) {
        self.sliderRanges = filter.sliders
        self.reloadData()
    }
}

extension SliderTableView: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sliderRanges.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SliderCell", forIndexPath: indexPath) as! SliderCell
        
        let sliderRange = self.sliderRanges[indexPath.row]
        
        cell.label.text = sliderRange.name
        cell.valueLabel.text = sliderRange.currentValue.description
        cell.slider.maximumValue = sliderRange.range.maximumValue
        cell.slider.minimumValue = sliderRange.range.minimumValue
        cell.slider.value = sliderRange.currentValue
        cell.upsdateSliderHandler = { [weak self] value in
          sliderRange.currentValue = value
            self?.upsdateSliderHandler?()
        }
        
        return cell
    }
}

extension SliderTableView: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
