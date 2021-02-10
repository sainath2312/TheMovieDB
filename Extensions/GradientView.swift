//
//  GradientView.swift
//  TheMovieDB
//
//  Created by Sainath Gajavada on 10/02/21.
//

import UIKit

extension UIView {
    
    func layerGradient(colors c:[CGColor]) {
        self.layer.sublayers = self.layer.sublayers?.filter(){!($0 is CAGradientLayer)}
        let layer : CAGradientLayer = CAGradientLayer()
        layer.frame.size = self.frame.size
        layer.frame.origin = CGPoint.zero
        layer.colors = c
        layer.cornerRadius = 10.0
        self.layer.insertSublayer(layer, at: 0)
        
    }
}
