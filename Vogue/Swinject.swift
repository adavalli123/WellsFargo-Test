//
//  Swinject.swift
//  Vogue
//
//  Created by Srikanth Adavalli on 7/31/16.
//  Copyright © 2016 Srikanth Adavalli. All rights reserved.
//

import Swinject

extension SwinjectStoryboard {
    class func setup() {
        
        //        To register dependencies of a view controller, use registerForStoryboard method.
        defaultContainer.registerForStoryboard(MainViewController.self) { resolver, controller in
            //
        }
        
        defaultContainer.registerForStoryboard(ItemViewController.self) { resolver, controller in
//            controller.shoppingItemService = resolver.resolve(ShoppingItemService.self)
//            controller.product = resolver.resolve(Product.self)
        }
        
        
        // Services
        defaultContainer.register(ShoppingItemService.self) { resolver in
            ShoppingItemServiceImpl(
                product: resolver.resolve(Product.self)!,
                requestProvider: resolver.resolve(RequestProvider.self)!,
                httpRequester: resolver.resolve(HTTPRequester.self)!,
                shoppingParser: resolver.resolve(ShoppingParser.self)!
            )
        }
        
        // MARK: Utilities
        defaultContainer.register(RequestProvider.self) { resolver in
            RequestProviderImpl()
        }
        
        defaultContainer.register(ShoppingParser.self) { resolver in
            ShoppingParser(product: resolver.resolve(Product.self)!)
        }
        
        defaultContainer.register(HTTPRequester.self) { resolver in
            HTTPRequesterImpl()
        }
        
        // MARK: Singletons
        defaultContainer.register(Product.self) { resolver in
            Product(rewardPoints: "")
            }.inObjectScope(.Container)
    }
}
