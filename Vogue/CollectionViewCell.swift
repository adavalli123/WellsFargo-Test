//
//  CollectionViewCell.swift
//  Vogue
//
//  Created by Srikanth Adavalli on 8/1/16.
//  Copyright © 2016 Srikanth Adavalli. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var productImage: UIImageView!
    
    func config(titleName: String, image: UIImage) {
        titleLabel.text = titleName
        productImage.image = image
    }
}
