//
//  DropitBehavior.swift
//  Dropit
//
//  Created by Maxim Veksler on 30/09/2015.
//  Copyright © 2015 Stanford University. All rights reserved.
//

import UIKit

class DropitBehavior: UIDynamicBehavior {
    let gravity = UIGravityBehavior()
    
    lazy var collider: UICollisionBehavior = {
        let lazilyCreatedCollider = UICollisionBehavior()
        lazilyCreatedCollider.translatesReferenceBoundsIntoBoundary = true
        return lazilyCreatedCollider
    }()

    lazy var dropBehaviour: UIDynamicItemBehavior = {
        let lazilyCreatedDropBehaviour = UIDynamicItemBehavior()
        lazilyCreatedDropBehaviour.allowsRotation = true
        lazilyCreatedDropBehaviour.elasticity = 0.75
        return lazilyCreatedDropBehaviour
    }()
    
    override init() {
        super.init()
        addChildBehavior(gravity)
        addChildBehavior(collider)
        addChildBehavior(dropBehaviour)
    }
    
    func addBarrier(path: UIBezierPath, named name: String) {
        collider.removeBoundaryWithIdentifier(name)
        collider.addBoundaryWithIdentifier(name, forPath: path)
    }
    
    func addDrop(drop: UIView) {
        dynamicAnimator?.referenceView?.addSubview(drop)
        gravity.addItem(drop)
        collider.addItem(drop)
        dropBehaviour.addItem(drop)
    }
    
    func removeDrop(drop: UIView) {
        gravity.removeItem(drop)
        collider.removeItem(drop)
        dropBehaviour.removeItem(drop)
        drop.removeFromSuperview()
    }
}
