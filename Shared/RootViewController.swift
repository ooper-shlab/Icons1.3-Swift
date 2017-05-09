//
//  RootViewController.swift
//  Icons
//
//  Translated by OOPer in cooperation with shlab.jp, on 2014/12/06.
//
//
/*
 Copyright (C) 2017 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information

 Abstract:
 The view controller displays what each icon does on iOS.
*/

import UIKit

let kTopBottomMargins: CGFloat = 20


@objc(RootViewController)
class RootViewController : UITableViewController {
    //! Icon information.
    private let icons: [(iconName: String, iconDescription: String, iconCellHeight: CGFloat)] = [
    ("Icon-60@3x",
    "Home screen on iPhone with retina HD display",
    60),
    
    ("Icon-60@2x",
    "Home screen on iPhone/iPod Touch with retina display (iOS 7+)",
    60),
    
    ("Icon-76",
    "Home screen on iPad (iOS 7+)",
    76),
    
    ("Icon-76@2x",
    "Home screen on iPad with retina display (iOS 7+)",
    76),
    
    ("Icon-83.5@2x",
    "Home screen on iPad Pro",
    83.5),
    
    ("Icon-Small-40",
    "Spotlight (iOS 7+)",
    40),
    
    ("Icon-Small-40@2x",
    "Spotlight on devices with retina display (iOS 7+)",
    40),
    
    ("Icon-Small-40@3x",
    "Spotlight on devices with retina HD display",
    40),
    
    ("Icon-Small",
    "Spotlight on iPhone/iPod Touch (iOS 6.1 and earlier), and Settings on all devices",
    40),
    
    ("Icon-Small@2x",
    "Spotlight on iPhone/iPod Touch with retina display (iOS 6.1 and earlier), and Settings on all devices with retina display",
    40),
    
    ("Icon-Small@3x",
    "Settings on devices with retina HD display",
    40),
    
    ("Icon",
    "Home screen on iPhone/iPod touch (iOS 6.1 and earlier)",
    57),
    
    ("Icon@2x",
    "Home screen on iPhone/iPod Touch with retina display (iOS 6.1 and earlier)",
    57),
    
    ("Icon-72",
    "Home screen on iPad (iOS 6.1 and earlier)",
    72),
    
    ("Icon-72@2x",
    "Home screen on iPad with retina display (iOS 6.1 and earlier)",
    72),
    
    ("Icon-Small-50",
    "Spotlight on iPad (iOS 6.1 and earlier)",
    50),
    
    ("Icon-Small-50@2x",
    "Spotlight on iPad with retina display (iOS 6.1 and earlier)",
    50),
    ]
    
    
    //| ----------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: -
    //MARK: UITableViewDelegate
    
    //| ----------------------------------------------------------------------------
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.icons[indexPath.row].iconCellHeight + kTopBottomMargins
    }
    
    //MARK: -
    //MARK: UITableViewDataSource
    
    //| ----------------------------------------------------------------------------
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.icons.count
    }
    
    
    //| ----------------------------------------------------------------------------
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.lineBreakMode = .byWordWrapping
        
        let iconName = self.icons[indexPath.row].iconName
        let iconPath = Bundle.main.path(forResource: iconName, ofType: "png")!
        let isRetina = iconName.range(of: "@2x") != nil
        let isRetinaHD = iconName.range(of: "@3x") != nil
        
        cell.imageView?.image = UIImage(data: try! Data(contentsOf: URL(fileURLWithPath: iconPath)), scale: (isRetinaHD ? 3 : (isRetina ? 2 : 1)))
        cell.textLabel?.text = iconName + ".png"
        cell.detailTextLabel?.text = self.icons[indexPath.row].iconDescription
        
        return cell
    }
    
}
