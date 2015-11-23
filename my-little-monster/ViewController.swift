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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodImg.dropTarget = monsterImg
        heartImg.dropTarget = monsterImg
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemDroppedOnCharacter:", name: "onTargetDropped", object: nil)
//          here we're gonna listen as an 'observer' for that notification
//          self is observer, selector is the function it's gonna call. the : means there's one or more params. NSNotifications pass in a NSNotification object as a parameter, so we have to put it here in this case. name of the incoming notification is "onTargetDropped"
    }
    
    func itemDroppedOnCharacter(notif: AnyObject) {
        print("ITEM DROPPED ON CHARACTER")
    }

}

