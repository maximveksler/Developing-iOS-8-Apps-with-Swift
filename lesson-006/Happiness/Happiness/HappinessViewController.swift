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
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
        }
    }
    
    private struct Constants {
        static let HappinessGeastureScale: CGFloat = 4
    }
    
    @IBAction func changeHappiness(geasture: UIPanGestureRecognizer) {
        switch geasture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = geasture.translationInView(faceView)
            let happinessChange = -Int(translation.y / Constants.HappinessGeastureScale)
            if happinessChange != 0 {
                happiness += happinessChange
                geasture.setTranslation(CGPointZero, inView: faceView)
            }
            
        default: break
            
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
