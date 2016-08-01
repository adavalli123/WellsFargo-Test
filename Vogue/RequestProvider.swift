//
//  Networking.swift
//  Vogue
//
//  Created by Srikanth Adavalli on 7/31/16.
//  Copyright © 2016 Srikanth Adavalli. All rights reserved.
//
import Foundation
protocol RequestProvider {
    func getShoppingItemsRequest() -> NSURLRequest?
}

class RequestProviderImpl: RequestProvider {
    func getShoppingItemsRequest() -> NSURLRequest? {
        let urlString: NSMutableURLRequest = NSMutableURLRequest(URL: NSURL(string: "http://54.191.35.66:8181/pfchang/api/buy?username=Michael&grandTotal=0")!)
        return NSMutableURLRequest(URL: urlString.URL!)
    }
}
