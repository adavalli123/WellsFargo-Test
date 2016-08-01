//
//  CollectionViewReusableView.swift
//  Vogue
//
//  Created by Srikanth Adavalli on 8/1/16.
//  Copyright © 2016 Srikanth Adavalli. All rights reserved.
//

import UIKit

class CollectionViewReusableView: UICollectionReusableView {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var productImage: UIImageView!
    
    func configReusableView(titleName: String, image: UIImage) {
        titleLabel.text = titleName
        productImage.image = image
    }
}
