//
//  ViewController.swift
//  my-little-monster
//
//  Created by Raizlabs Corp on 11/19/15.
//  Copyright © 2015 Raizlabs Corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monsterImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var imgArray = [UIImage]()
        for var x = 1; x <= 4; x++ {
            let img = UIImage(named: "idle\(x).png")
//            this img is an optional but our imgArray is demanding something that's not an optional
            imgArray.append(img!)
//            we know there's a value here so we can force unwrap. if this crashes, it will do so in testing
        }
        
        monsterImg.animationImages = imgArray
        monsterImg.animationDuration = 0.8
        monsterImg.animationRepeatCount = 0
//        this means it will cycle through the animations infinitely
        monsterImg.startAnimating()
    }
}

