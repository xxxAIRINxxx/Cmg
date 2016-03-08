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
    
    private var sliders: [Slider] = []

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
        self.sliders = filter.sliders
        self.reloadData()
    }
}

extension SliderTableView: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sliders.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SliderCell", forIndexPath: indexPath) as! SliderCell
        
        let slider = self.sliders[indexPath.row]
        
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
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
