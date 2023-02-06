//
//  Extensions.swift
//  MortageCalculator
//
//  Created by Artur on 29/01/2023.
//

import UIKit

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailling: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        if let trailling = trailling {
            trailingAnchor.constraint(equalTo: trailling, constant: -padding.right).isActive = true
        }
       
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}
extension UISlider {
    func configuration(min: Float, max: Float) {
        minimumValue = min
        maximumValue = max
        value = (minimumValue + maximumValue) / 2
        minimumTrackTintColor = .systemIndigo
        maximumTrackTintColor = .white
        setThumbImage(UIImage(named: "Circlex.png"), for: .normal)
    }
}
