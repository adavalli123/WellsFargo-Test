//
//  TestError.swift
//  Vogue
//
//  Created by Srikanth Adavalli on 7/31/16.
//  Copyright © 2016 Srikanth Adavalli. All rights reserved.
//

import Foundation

class TestError: NSError {
    init(_ message: String) {
        super.init(domain: "Test", code: 0, userInfo: ["message": message])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
