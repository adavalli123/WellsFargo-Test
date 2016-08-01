//
//  Parser.swift
//  Vogue
//
//  Created by Srikanth Adavalli on 7/31/16.
//  Copyright © 2016 Srikanth Adavalli. All rights reserved.
//

import SwiftyJSON
import Alamofire

class ShoppingParser{
    
    var product: Product!
    
    init(product: Product) {
        self.product = product
    }
    
    func requestMethod(data: NSData) -> ParserResult<String> {
        let responeJson = JSON(data: data)
        let objectCategory = responeJson
        let response = objectCategory["rewardPoints"]
        print(response)
        return ParserResult.success("\(response)")
    }
}
