//
//  DragImg.swift
//  my-little-monster
//
//  Created by Raizlabs Corp on 11/20/15.
//  Copyright © 2015 Raizlabs Corp. All rights reserved.
//

import Foundation
import UIKit

class DragImg: UIImageView {
    
    var originalPosition: CGPoint!
//    has an x & y coordinate. we use this to store the original location to send back the image after an unsuccessful drag..
    override init(frame: CGRect) {
//        we're overriding the uiimageview initializer but also including some of the original
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        originalPosition = self.center
//        self is the imageView. grabbing it's center at the beginning of a drag
//        we can't set this up in the initializers since they're called before the layout is set up. the center may not be correct at that time.
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        will give us an array of touches
        if let touch = touches.first { // saying grab the very first touch from the touches set
//            preventing crashes with the if. the let makes touch immutable. can't be changed
            let position = touch.locationInView(self.superview)
//            getting the coordinates of this touch within the superview. it's the view that has all our stuff e.g. golem, hearts, etc..
            self.center = CGPointMake(position.x, position.y)
//            move the ImageView center to the position you've dragged to. wherever your finger is dragging move it there
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.center = originalPosition
    }
}