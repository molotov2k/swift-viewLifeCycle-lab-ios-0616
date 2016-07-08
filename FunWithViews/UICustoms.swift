//
//  UICustoms.swift
//  FunWithViews
//
//  Created by Max Tkach on 7/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class DiceView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.greenColor()
        self.layer.cornerRadius = 25
        self.layer.borderWidth = 2
        self.hidden = true
    }
    
    convenience init(width: CGFloat, height: CGFloat) {
        self.init(frame: CGRect(
            x: UIScreen.mainScreen().bounds.width / 12 * width,
            y: UIScreen.mainScreen().bounds.height / 24 * height,
            width: UIScreen.mainScreen().bounds.width / 6,
            height: UIScreen.mainScreen().bounds.width / 6))
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
}


class DiceLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.randomColor()
        self.textAlignment = NSTextAlignment.Center
        self.font = UIFont.systemFontOfSize(UIScreen.mainScreen().bounds.width / 14)
        self.hidden = true
    }
    
    convenience init(width: CGFloat) {
        self.init(frame: CGRect(
            x: UIScreen.mainScreen().bounds.width / 13 * width,
            y: UIScreen.mainScreen().bounds.height / 24 * 13,
            width: UIScreen.mainScreen().bounds.width / 13,
            height: UIScreen.mainScreen().bounds.width / 13))
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
}


extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}


extension UIColor {
    static func randomColor() -> UIColor {
        return UIColor(red: .random(), green: .random(), blue: .random(), alpha: 1.0)
    }
}
