//
//  Product.swift
//  Vogue
//
//  Created by Srikanth Adavalli on 7/31/16.
//  Copyright © 2016 Srikanth Adavalli. All rights reserved.
//

import Foundation

class Product: Equatable {
    var rewardPoints: String!
    
    init(rewardPoints: String) {
        self.rewardPoints = rewardPoints
    }
}

func ==(lhs: Product, rhs: Product) -> Bool {
    guard lhs.rewardPoints == rhs.rewardPoints else { return false }
    return true
}
