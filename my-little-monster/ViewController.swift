//
//  ViewController.swift
//  my-little-monster
//
//  Created by Raizlabs Corp on 11/19/15.
//  Copyright © 2015 Raizlabs Corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monsterImg: MonsterImg!
    @IBOutlet weak var foodImg: DragImg!
    @IBOutlet weak var heartImg: DragImg!
    @IBOutlet weak var penalty1Img: UIImageView!
    @IBOutlet weak var penalty2Img: UIImageView!
    @IBOutlet weak var penalty3Img: UIImageView!

    
    let DIM_ALPHA: CGFloat = 0.2 // a special type of float used for alpha
//    all caps lets the user know it's a constant that's not gonna change
    let OPAQUE: CGFloat = 1.0
//    setting the alpha when it's dim. the variable used to set the opacity on the skulls
    let MAX_PENALTIES = 3
    
    var penalties = 0
    var timer: NSTimer! // initializing a timer variable we know we'll use
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodImg.dropTarget = monsterImg
        heartImg.dropTarget = monsterImg
        
        penalty1Img.alpha = DIM_ALPHA
        penalty2Img.alpha = DIM_ALPHA
        penalty3Img.alpha = DIM_ALPHA
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemDroppedOnCharacter:", name: "onTargetDropped", object: nil)
//          here we're gonna listen as an 'observer' for that notification
//          self is observer, selector is the function it's gonna call. the : means there's one or more params. NSNotifications pass in a NSNotification object as a parameter, so we have to put it here in this case. name of the incoming notification is "onTargetDropped"
        startTimer()
    }
    
    func itemDroppedOnCharacter(notif: AnyObject) {
    }
    
    func startTimer() {
        if timer != nil {
//            saying before we start a timer, let's just stop the old one
            timer.invalidate()
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "changeGameState", userInfo: nil, repeats: true) // gonna call the changeGameState function every three seconds
    }
    
    func changeGameState() {
        penalties++
        
        if penalties == 1 {
            penalty1Img.alpha = OPAQUE
            penalty2Img.alpha = DIM_ALPHA
        } else if penalties == 2 {
            penalty2Img.alpha = OPAQUE
            penalty3Img.alpha = DIM_ALPHA
        } else if penalties >= 3 {
            penalty3Img.alpha = OPAQUE
        } else {
            penalty1Img.alpha = DIM_ALPHA
            penalty2Img.alpha = DIM_ALPHA
            penalty3Img.alpha = DIM_ALPHA
        }
        
        if penalties >= MAX_PENALTIES {
            gameOver()
        }
    }
    
    func gameOver() {
        timer.invalidate()
        monsterImg.playDeathAnimation()
    }

}

