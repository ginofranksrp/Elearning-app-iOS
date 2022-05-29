//
//  UIVIewCustom.swift
//  elearning
//
//  Created by Gino Franks Rubio Pacheco on 27/05/22.
//

import Foundation
import UIKit

@IBDesignable public class UIViewCustom : UIView {
    
    @IBInspectable var atCircle: Bool = false {
        didSet {
            if atCircle {
                layer.cornerRadius = bounds.size.width / 2
            }
        }
    }
    
    @IBInspectable var cornerRadius: Double {
        get {
            return Double(self.layer.cornerRadius)
        }
        set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.shadowColor!)
        }
        set {
            self.layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            self.layer.shadowOpacity = newValue
        }
    }
    @IBInspectable var shadowOffset: CGSize {
        get {
            return self.layer.shadowOffset
        }
        set {
            self.layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowRadius: Double {
        get {
            return Double(self.layer.shadowRadius)
        }
        set {
            self.layer.shadowRadius = CGFloat(newValue)
        }
    }

    private let animationDuration: TimeInterval = 1.0
    private let deleyTime: TimeInterval = 0
    private let springDamping: CGFloat = 0.25
    private let lowSpringDamping: CGFloat = 0.50
    private let springVelocity: CGFloat = 8.00
}
