//
//  PopAnimator.swift
//  Vogue
//
//  Created by Srikanth Adavalli on 8/1/16.
//  Copyright © 2016 Srikanth Adavalli. All rights reserved.
//

import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?)-> NSTimeInterval {
        return 0
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
    }
}

extension MainViewController: UIViewControllerTransitioningDelegate {
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController?{
        return PresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
}