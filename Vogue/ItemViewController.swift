//
//  ItemViewController.swift
//  Vogue
//
//  Created by Srikanth Adavalli on 7/31/16.
//  Copyright © 2016 Srikanth Adavalli. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var loyaltyButton: UIButton!
    @IBOutlet var scrollView: UIScrollView!
    var images: [UIImage] = [UIImage(named: "003.png")!, UIImage(named: "004.png")!, UIImage(named: "005.png")!, UIImage(named: "006.png")!]
    var imageViews:[UIImageView] = []
    var indexNumber: Int!
    
    var product: Product!
    var shoppingItemService: ShoppingItemService!
    
    @IBOutlet var pageControl: UIPageControl!
    var frame: CGRect = CGRectMake(0, 0, 0, 0)
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        configurePageControl()
        
        for index in 0..<images.count {
            
            frame.origin.x = self.scrollView.frame.size.width * CGFloat(index)
            frame.size = self.scrollView.frame.size
            self.scrollView.pagingEnabled = true
            self.scrollView.showsHorizontalScrollIndicator = false
            self.scrollView.delegate = self
            
            for image in images {
                let imageView = UIImageView(image: image)
                imageView.translatesAutoresizingMaskIntoConstraints = true
                self.scrollView.pagingEnabled = true
                scrollView.addSubview(imageView)
                imageViews.append(imageView)
            }
        }
        
        shoppingItemService.updateList().then { result in
            dispatch_async(dispatch_get_main_queue()){
                switch result{
                case .success(let data):
                    self.loyaltyButton.setTitle("Loyalty Points: \(data)",forState: .Normal)
                case .failure:
                    print("Error in getting the data")
                }
            }
        }
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.automaticallyAdjustsScrollViewInsets = false
        for (index,imageView) in imageViews.enumerate() {
            imageView.contentMode = UIViewContentMode.Center
            imageView.contentMode = UIViewContentMode.ScaleAspectFit
            imageView.frame = CGRectMake(CGFloat(index)*(self.view.frame.size.width-40), 0, self.view.frame.size.width-40, 200)
            
        }
        scrollView.contentSize = CGSizeMake((scrollView.frame.size.width)*(CGFloat(imageViews.count-1)), 1)
    }
    
    func configurePageControl() {
        self.pageControl.numberOfPages = images.count
        self.pageControl.currentPage = 0
        self.pageControl.pageIndicatorTintColor = UIColor.grayColor()
        self.pageControl.currentPageIndicatorTintColor = UIColor.blueColor()
        self.view.addSubview(pageControl)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        let number:Int = Int(pageNumber) % Int(images.count)
        pageControl.currentPage = number
    }
}
