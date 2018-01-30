//
//  ViewController.swift
//  UIScrollView+UICollectionView
//
//  Created by Jitae Kim on 1/29/18.
//  Copyright © 2018 Jitae Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.isScrollEnabled = false
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 60
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.lightGray : UIColor.red
        
        return cell
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView == self.scrollView {
            collectionView.isScrollEnabled = (self.scrollView.contentOffset.y >= headerViewHeightConstraint.constant)
        }
        
        if scrollView == self.collectionView {
            collectionView.isScrollEnabled = (collectionView.contentOffset.y > 0)
        }
    }

}

