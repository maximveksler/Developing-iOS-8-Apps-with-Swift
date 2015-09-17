//
//  ViewController.swift
//  Cassini
//
//  Created by Maxim Veksler on 11/09/2015.
//  Copyright © 2015 Stanford University. All rights reserved.
//

import UIKit

indirect enum Tree<T> {
    case Leaf(T)
    case Branch(left: Tree<T>, right: Tree<T>)
}

indirect enum Tree2 {
        case Leaf
        case Branch(left: String, right: String)
}

class ViewController: UIViewController {
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let svg = segue.destinationViewController as? ImageViewController {
            if let identifier = segue.identifier {
                svg.title = identifier
                
                switch identifier {
                case "Earth":
                    svg.imageURL = DemoURL.NASA.Earth
                case "Cassini":
                    svg.imageURL = DemoURL.NASA.Cassini
                case "Saturn":
                    svg.imageURL = DemoURL.NASA.Saturn
                default: break
                }
            }
        }
    }
}

