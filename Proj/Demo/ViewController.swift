//
//  ViewController.swift
//  Demo
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import UIKit
import Cmg

final class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: StretchImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var sliderTableView: SliderTableView!
    
    fileprivate weak var selectedFilter: PhotoProcessable?
    
    fileprivate var filters: [PhotoProcessable] = FilterGenerator.generate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
    }
    
    fileprivate func setup() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Photo",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(ViewController.requestPhoto))
        
        self.imageView.image = FilterGenerator.originalImage
        
        self.collectionView.register(UINib(nibName: "FilterCell", bundle: nil), forCellWithReuseIdentifier: "FilterCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.headerReferenceSize = CGSize.zero
        flowLayout.sectionInset = UIEdgeInsetsMake(10.0, 10.0, 0.0, 10.0)
        flowLayout.itemSize = CGSize(width: 80, height: 110)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 0
        self.collectionView.collectionViewLayout = flowLayout
        
        self.sliderTableView.upsdateSliderHandler = { [unowned self] in
            let image = self.selectedFilter!.processing(FilterGenerator.originalImage)
            self.imageView.image = image
        }
    }
    
    @objc fileprivate func requestPhoto() {
        PhotoRequester.showActionSheet(self) { [unowned self] result in
            switch result {
            case .success(let image):
                let _image = image.fixOrientation()
                FilterGenerator.originalImage = _image.cmg_resizeAtAspectFit(Image.original.size)!
                FilterGenerator.thumbnailImage = _image.cmg_resizeAtAspectFit(Image.thumbnail.size)!
                self.imageView.image = FilterGenerator.originalImage
                self.filters = FilterGenerator.generate()
                self.selectedFilter = nil
                self.collectionView.reloadData()
            case .faild:
                break
            case .cancel:
                break
            }
        }
    }
}

// MARK: - UICollectionViewDataSource

extension ViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.filters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCell", for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let filter = self.filters[(indexPath as NSIndexPath).row]
        
        switch cell {
        case let _cell as FilterCell:
            if filter.thumbnailImage == nil {
                filter.thumbnailImage = filter.processing(FilterGenerator.thumbnailImage)
            }
            if let _selectedFilter = self.selectedFilter {
                _cell.isSelectedFilter = _selectedFilter.name == filter.name
            } else {
                _cell.isSelectedFilter = false
            }
            _cell.setFilter(filter)
        default:
            break
        }
    }
}

// MARK: - UICollectionViewDelegate

extension ViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let filter = self.filters[(indexPath as NSIndexPath).row]
        
        if (self.selectedFilter.flatMap() { $0 === filter }) == true { return }
        
        self.selectedFilter = filter
        filter.resetSliderValues()
        self.sliderTableView.updateSliders(filter)
        
        self.imageView.image = filter.processing(FilterGenerator.originalImage)
        
        collectionView.reloadItems(at: collectionView.indexPathsForVisibleItems)
    }
}
