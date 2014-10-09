//
//  FirstViewController.swift
//  autolayout
//
//  Created by 濱田 章吾 on 2014/10/08.
//  Copyright (c) 2014年 hamasyou. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("customCell") as CustomTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.thumbView.image = UIImage(named: "Image1")
            cell.labelView.text  = "いろはにほへとちりぬるをわかよたれそつねならむうゐのおくやまけふこえてあさきゆめみしゑひもせす色はにほへど散りぬるを我が世たれぞ常ならむ有為の奥山今日越えて浅き夢見じ酔ひもせず"
        case 1:
            cell.thumbView.image = UIImage(named: "Image2")
            cell.labelView.text  = "Cozy lummox gives smart squid who asks for job pen."
        default:
            break
        }
        return cell
    }
    
    
    // MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath) as CustomTableViewCell
        var newBounds = cell.bounds
        newBounds.size.width = tableView.bounds.width
        cell.bounds = newBounds
        
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        return cell.preferredView.bounds.height
    }
    
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

