//
//  HTTPRequestor.swift
//  Vogue
//
//  Created by Srikanth Adavalli on 7/31/16.
//  Copyright © 2016 Srikanth Adavalli. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import CBGPromise

protocol HTTPRequester {
    func perform(request: NSURLRequest) -> Future<HttpRequestResult>
}

class HTTPRequesterImpl: HTTPRequester {
    func perform(request: NSURLRequest) -> Future<HttpRequestResult> {
        let promise = Promise<HttpRequestResult>()
        
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            
            func rejectPromise(reason: String) {
                promise.resolve(.failure((TestError("Failed Request: " + reason))))
            }
            
            let parameters:[String: AnyObject] = [:]
            
            Alamofire.request(.POST, request, parameters: parameters, encoding: .JSON)
                .responseJSON { response in
                    guard response.result.error == nil else {
                        // got an error in getting the data, need to handle it
                        print("error calling POST on /todos/1")
                        print(response.result.error!)
                        return
                    }
                    
                    if let value = response.result.value {
                        let todo = JSON(value)
                        print("The todo is: " + todo.description)
                    }
            
                guard let data = response.data else { rejectPromise("data was nil"); return }
                promise.resolve(.success(data: data))
            }
        }
        
        return promise.future
    }
}
