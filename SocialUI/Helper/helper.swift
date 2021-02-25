//
//  helper.swift
//  SocialUI
//
//  Created by Rohit Saini on 25/02/21.
//

import UIKit


//======================================================================
//MARK:- sainiCardView
open class sainiCardView: UIView {
    
    @IBInspectable var cornerRadious : CGFloat = 5
    @IBInspectable var shadowColor : UIColor? = UIColor.black
    
    @IBInspectable let shadowOffSetWidth : Int = 0
    @IBInspectable let shadowOffSetHeight : Int =  1
    
    @IBInspectable var shadowOpacity : CGFloat = 0.2
    
    override open func layoutSubviews(){
        layer.cornerRadius = cornerRadious
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        
        let shadowpath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadious)
        layer.shadowPath =  shadowpath.cgPath
        layer.shadowOpacity = Float(shadowOpacity)
    }
}

//MARK:- roundViewCorner
open class roundViewCorner: UIView {
    
    @IBInspectable var cornerRadius : CGFloat = 5
    @IBInspectable  var topLeft: Bool = false
    @IBInspectable  var topRight: Bool = false
    @IBInspectable  var bottomLeft: Bool = false
    @IBInspectable  var bottomRight: Bool = false
    
    override open func layoutSubviews(){
        var options = UIRectCorner()
        if topLeft {
            options =  options.union(.topLeft)
        }
        if topRight {
            options =  options.union(.topRight)
        }
        if bottomLeft {
            options =  options.union(.bottomLeft)
        }
        if bottomRight {
            options =  options.union(.bottomRight)
        }
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: options, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

