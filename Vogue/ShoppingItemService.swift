//
//  ShoppingItemService.swift
//  Vogue
//
//  Created by Srikanth Adavalli on 7/31/16.
//  Copyright © 2016 Srikanth Adavalli. All rights reserved.
//

import Foundation
import CBGPromise

protocol ShoppingItemService {
    func updateList() -> Future<ParserResult<String>>
}

class ShoppingItemServiceImpl: ShoppingItemService {
    let product: Product
    let requestProvider: RequestProvider
    let httpRequester: HTTPRequester
    let shoppingParser: ShoppingParser
    
    init(product: Product, requestProvider: RequestProvider, httpRequester: HTTPRequester,  shoppingParser: ShoppingParser) {
        self.product = product
        self.requestProvider = requestProvider
        self.httpRequester = httpRequester
        self.shoppingParser = shoppingParser
    }
    
    func updateList() -> Future<ParserResult<String>> {
        let shoppingPromise = Promise<ParserResult<String>>()
        
        httpRequester.perform(requestProvider.getShoppingItemsRequest()!)
            .then { httpResult in
                switch httpResult {
                case .success(let data):
                    shoppingPromise.resolve(self.shoppingParser.requestMethod(data))
                case .failure(let error):
                    shoppingPromise.resolve(.failure(error))
                }
        }
        return shoppingPromise.future
    }
}