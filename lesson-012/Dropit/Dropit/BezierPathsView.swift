//
//  BezierPathsView.swift
//  Dropit
//
//  Created by Maxim Veksler on 30/09/2015.
//  Copyright © 2015 Stanford University. All rights reserved.
//

import UIKit

class BezierPathsView: UIView {

    private var bezierPaths = [String:UIBezierPath]()
    
    func setPath(path: UIBezierPath?, named name: String) {
        bezierPaths[name] = path
        setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        for(_, path) in bezierPaths {
            path.stroke()
        }
    }

}
