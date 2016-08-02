//
//  TouchIDViewController.swift
//  Vogue
//
//  Created by Srikanth Adavalli on 8/1/16.
//  Copyright © 2016 Srikanth Adavalli. All rights reserved.
//

import UIKit
import LocalAuthentication
class TouchIDViewController: UIViewController {
    
    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(animated)
        authorize()
    }
    
    func authorize() {
        
        let context = LAContext()
        var error: NSError?
        //
        //        // 2
        //        // check if Touch ID is available
        if context.canEvaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, error: &error) {
            //            // 3
            let reason = "Authenticate with Touch ID"
            context.evaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply:
                {(succes: Bool, error: NSError?) in
                    //                    // 4
                    if succes {
                        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                            //                            self.showAlertController("Touch ID Authentication Succeeded")
                            //
                            self.performSegueWithIdentifier("ItemViewController", sender: nil)
                        })
                    }
            })
        }
    }
    
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
    if segue!.identifier == "ItemViewController" {
    }
    }
}