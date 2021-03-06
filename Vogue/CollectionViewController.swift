//
//  CollectionViewController.swift
//  Vogue
//
//  Created by Srikanth Adavalli on 8/1/16.
//  Copyright © 2016 Srikanth Adavalli. All rights reserved.
//

import UIKit
import BBBadgeBarButtonItem

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var badgeButton: MIBadgeButton!
    @IBOutlet var CartBarButton: UIBarButtonItem!
    @IBOutlet var collectionview: UICollectionView!
    @IBOutlet var addToCart: UIButton!
    
    var arrayLabel: [String]! = ["SneakersA $49.95", "Shoes B $79.95", "Dress A   $99.00", "Dress B   $89.00"]
    var accessoryImage: [UIImage]! = [UIImage(named: "003")!, UIImage(named: "004")!, UIImage(named: "007")!, UIImage(named: "008")!]
    
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.delegate = self
        collectionview.dataSource = self
        
        badgeButton.badgeString = "\(count)"
    }
    
    func setUpCart() {
//        let button = CartBarButton
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.productImage.layer.masksToBounds = true
        cell.productImage.layer.cornerRadius = 2
        
        cell.config(arrayLabel[indexPath.item], image: accessoryImage[indexPath.item])
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayLabel.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let view = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath) as! CollectionViewReusableView
        
        view.configReusableView("Featured Item: Magician Hat        $39.00", image: UIImage.init(named: "003")! )
        view.layoutIfNeeded()
        return view;
    }
    
    @IBAction func backBarButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(false)
    }
    
}
