//
//  SecondViewController.swift
//  autolayout
//
//  Created by 濱田 章吾 on 2014/10/08.
//  Copyright (c) 2014年 hamasyou. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var preferredViews: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let images = [UIImage(named: "Image1")!, UIImage(named: "Image2")!, UIImage(named: "Image3")!]
        self.preferredViews = [UIView]()
        
        for image in images {
            let preferredView = UIView(frame: CGRectMake(0, 0, image.size.width, image.size.height))
            let imageView = UIImageView(frame: CGRectMake(0, 0, image.size.width, image.size.height))
            imageView.image = image
            imageView.contentMode = .ScaleAspectFill
            imageView.clipsToBounds = true
            preferredView.setTranslatesAutoresizingMaskIntoConstraints(false)
            imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
            preferredView.addSubview(imageView)
            scrollView.addSubview(preferredView)
            
            preferredViews.append(preferredView)
        }
    }
    
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        var prevView: UIView? = nil
        for preferredView in preferredViews {
            let imageView = preferredView.subviews[0] as UIImageView
            preferredView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[imageView]|",
                options: nil, metrics: nil, views: ["imageView": imageView]))
            preferredView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[imageView]|",
                options: nil, metrics: nil, views: ["imageView": imageView]))
            
            if prevView == nil {
                scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[preferredView(==scrollView)]",
                    options: nil, metrics: nil, views: ["scrollView": scrollView, "preferredView": preferredView]))
            } else {
                scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[prevView][preferredView(==scrollView)]",
                    options: nil, metrics: nil, views: ["scrollView": scrollView, "prevView": prevView!, "preferredView": preferredView]))
            }
            scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[preferredView(==scrollView)]",
                options: nil, metrics: nil, views: ["scrollView": scrollView, "preferredView": preferredView]))
            
            prevView = preferredView
        }
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let contentWidth = CGFloat(preferredViews.count) * scrollView.bounds.width
        let contentHeight = scrollView.bounds.height
        scrollView.contentSize = CGSizeMake(contentWidth, contentHeight)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

