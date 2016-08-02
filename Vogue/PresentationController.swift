////
////  PopAnimator.swift
////  Vogue
////
////  Created by Srikanth Adavalli on 8/1/16.
////  Copyright © 2016 Srikanth Adavalli. All rights reserved.
////
//
//import UIKit
//
//class PresentationController: UIPresentationController {
//    
//    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
//        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
//    }
//    
//    override func containerViewWillLayoutSubviews() {
//        let popX = CGFloat(50)
//        let popY = UIScreen.mainScreen().bounds.height - 350
//        let width = UIScreen.mainScreen().bounds.width - 100
//        presentedView()?.frame = CGRect(x: popX, y: popY, width: width, height: 350)
//        
//    }
//    
//}