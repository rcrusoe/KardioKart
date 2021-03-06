//
//  RaceTrackAvatar.swift
//  KardioKart
//
//  Created by Brent Raines on 10/25/15.
//  Copyright © 2015 Kartio. All rights reserved.
//

import UIKit
import Parse

class RaceTrackAvatar: UIView {
    var label = UILabel()
    var user: PFObject?
    
    convenience init(user: PFObject) {
        self.init(frame: CGRectMake(0.0, 0.0, 50.0, 50.0))
        self.user = user
        let name = user["name"] as? String ?? ""
        self.layer.borderColor = UIColor(red:0.333,  green:0.427,  blue:0.475, alpha:1).CGColor
        self.layer.borderWidth = 2.5
        self.layer.cornerRadius = self.bounds.width / 2
        self.backgroundColor = UIColor.whiteColor()
        label.textColor = UIColor(red:0.333,  green:0.427,  blue:0.475, alpha:1)
        let names: [String] = name.componentsSeparatedByString(" ")
        var initials = ""
        for name in names {
            initials += String(name[name.startIndex])
        }
        if let font = UIFont(name: "AvenirNextCondensed-Medium", size: 25.0) {
            label.attributedText = NSAttributedString(string: initials, attributes: ["NSFontAttributeName": font])
        } else {
            label.text = initials
        }
        label.sizeToFit()
        label.center = self.center
        self.addSubview(label)
    }

}
