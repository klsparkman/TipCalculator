//
//  StyleGuide.swift
//  TipCalculator
//
//  Created by Kelsey Sparkman on 4/6/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

import UIKit

extension UIView {
    
    func addCornerRadius(_ radius: CGFloat = 4) {
            self.layer.cornerRadius = radius
        }
        
    func addAccentBorder(width: CGFloat = 1, color: UIColor) {
            self.layer.borderWidth = width
            self.layer.borderColor = color.cgColor
        }
        
        func rotate(by radians: CGFloat = (-CGFloat.pi/2)) {
            self.transform = CGAffineTransform(rotationAngle: radians)
        }
    }//end of extension

    extension UIColor {
        static let pinkColor = UIColor(named: "pinkColor")!
        static let brownColor = UIColor(named: "brownColor")!
        static let tealColor = UIColor(named: "tealColor")!
        static let greenColor = UIColor(named: "greenColor")!
        static let lightTeal = UIColor(named: "lightTeal")!
    }


