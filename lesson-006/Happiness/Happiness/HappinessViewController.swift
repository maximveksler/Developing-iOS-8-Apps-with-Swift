//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Maxim Veksler on 25/08/2015.
//  Copyright © 2015 Stanford University. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDatasource {

    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
        }
    }
    
    var happiness: Int = 75 { // 0 = very sad 100 = ecstatic
        didSet {
            happiness = min(max(happiness, 0), 100)
            print("happiness = \(happiness)")
            updateUI()
        }
    }
    
    func updateUI() {
        faceView.setNeedsDisplay()
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness-50)/50
    }
}
