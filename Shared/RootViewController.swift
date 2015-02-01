//
//  RootViewController.swift
//  Icons
//
//  Translated by OOPer in cooperation with shlab.jp, on 2014/12/06.
//
//
/*
     File: RootViewController.h
     File: RootViewController.m
 Abstract: The view controller displays what each icon does on iOS.
  Version: 1.3

 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple
 Inc. ("Apple") in consideration of your agreement to the following
 terms, and your use, installation, modification or redistribution of
 this Apple software constitutes acceptance of these terms.  If you do
 not agree with these terms, please do not use, install, modify or
 redistribute this Apple software.

 In consideration of your agreement to abide by the following terms, and
 subject to these terms, Apple grants you a personal, non-exclusive
 license, under Apple's copyrights in this original Apple software (the
 "Apple Software"), to use, reproduce, modify and redistribute the Apple
 Software, with or without modifications, in source and/or binary forms;
 provided that if you redistribute the Apple Software in its entirety and
 without modifications, you must retain this notice and the following
 text and disclaimers in all such redistributions of the Apple Software.
 Neither the name, trademarks, service marks or logos of Apple Inc. may
 be used to endorse or promote products derived from the Apple Software
 without specific prior written permission from Apple.  Except as
 expressly stated in this notice, no other rights or licenses, express or
 implied, are granted by Apple herein, including but not limited to any
 patent rights that may be infringed by your derivative works or by other
 works in which the Apple Software may be incorporated.

 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
 FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.

 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.

 Copyright (C) 2014 Apple Inc. All Rights Reserved.

*/

import UIKit

let kTopBottomMargins: CGFloat = 20


@objc(RootViewController)
class RootViewController : UITableViewController {
    //! Icon information.
    private let icons: [(iconName: String, iconDescription: String, iconCellHeight: CGFloat)] = [
        ("Icon-60@3x",
            "Home screen on iPhone 6 Plus",
            60),
        ("Icon-60@2x",
            "Home screen on iPhone/iPod Touch with retina display (iOS 7+)",
            60),
        ("Icon-76",
            "Home screen on iPad (iOS 7)",
            76),
        ("Icon-76@2x",
            "Home screen on iPad with retina display (iOS 7+)",
            76),
        ("Icon-Small-40",
            "Spotlight (iOS 7)",
            40),
        ("Icon-Small-40@2x",
            "Spotlight on devices with retina display (iOS 7+)",
            40),
        ("Icon-Small-40@3x",
            "Spotlight on iPhone 6 Plus",
            40),
        ("Icon-Small",
            "Spotlight on iPhone/iPod Touch (iOS 6.1 and earlier) and Settings",
            40),
        ("Icon-Small@2x",
            "Spotlight on iPhone/iPod Touch with retina display (iOS 6.1 and earlier) and Settings on devices with retina display",
            75),
        ("Icon-Small@3x",
            "Settings on iPhone 6 Plus",
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
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.icons[Int(indexPath.row)].iconCellHeight + kTopBottomMargins
    }
    
    //MARK: -
    //MARK: UITableViewDataSource
    
    //| ----------------------------------------------------------------------------
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.icons.count
    }
    
    
    //| ----------------------------------------------------------------------------
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellID", forIndexPath: indexPath) as UITableViewCell
        
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        let iconName = self.icons[Int(indexPath.row)].iconName
        let iconPath = NSBundle.mainBundle().pathForResource(iconName, ofType: "png")!
        let isRetina = iconName.rangeOfString("@2x") != nil
        
        cell.imageView?.image = UIImage(data: NSData(contentsOfFile: iconPath)!, scale: (isRetina ? 2 : 1))
        cell.textLabel?.text = iconName + ".png"
        cell.detailTextLabel?.text = self.icons[Int(indexPath.row)].iconDescription
        
        return cell
    }
    
}