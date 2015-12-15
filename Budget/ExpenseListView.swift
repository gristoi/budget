//
//  ExpenseListView.swift
//  Budget
//
//  Created by Ian Gristock on 15/12/2015.
//  Copyright © 2015 Ian Gristock. All rights reserved.
//

import UIKit

class ExpenseListView: UIView {

    var animator: UIDynamicAnimator!
    var container: UICollisionBehavior!
    var snap: UISnapBehavior!
    var dynamicItem: UIDynamicItemBehavior!
    var gravity: UIGravityBehavior!
    
    var panGesture: UIPanGestureRecognizer!
    
    func setup()
    {
        panGesture = UIPanGestureRecognizer(target:self, action: "handlePan:")
        panGesture.cancelsTouchesInView = false
        self.addGestureRecognizer(panGesture)
        
        animator = UIDynamicAnimator(referenceView: self.superview!)
        dynamicItem = UIDynamicItemBehavior(items: [self])
        dynamicItem.allowsRotation = false
        dynamicItem.elasticity = 0
        
        gravity = UIGravityBehavior(items: [self])
        gravity.gravityDirection = CGVectorMake(0, -1)
        container = UICollisionBehavior(items: [self])
        
        configureContainer()
        
        animator.addBehavior(gravity)
        animator.addBehavior(dynamicItem)
        animator.addBehavior(container)
    }
    
    func configureContainer (){
        let boundaryWidth = UIScreen.mainScreen().bounds.size.width
        container.addBoundaryWithIdentifier("upper", fromPoint: CGPointMake(0, 0), toPoint: CGPointMake(boundaryWidth,0))
//        let boundaryHeight = UIScreen.mainScreen().bounds.size.height
//        container.addBoundaryWithIdentifier("lower", fromPoint: CGPointMake(0, boundaryHeight - 5), toPoint: CGPointMake(boundaryWidth, boundaryHeight - 5))
    }
    
    func handlePan (pan:UIPanGestureRecognizer){
        let velocity = pan.velocityInView(self.superview).y
        
        var movement = self.frame
        movement.origin.x = 0
        movement.origin.y = movement.origin.y + (velocity * 0.1)
        
        if pan.state == .Ended {
            panGestureEnded()
        }else if pan.state == .Began {
            snapToBottom()
        }else{
            if(snap != nil){
                animator.removeBehavior(snap)
            }
            snap = UISnapBehavior(item: self, snapToPoint: CGPointMake(CGRectGetMidX(movement), CGRectGetMidY(movement)))
            animator.addBehavior(snap)
        }
        
    }
    
    func panGestureEnded () {
        animator.removeBehavior(snap)
        
        let velocity = dynamicItem.linearVelocityForItem(self)
        
        if fabsf(Float(velocity.y)) > 250 {
            if velocity.y < 0 {
                snapToBottom()
            }else{
                snapToTop()
            }
        }else{
            if let superViewHeigt = self.superview?.bounds.size.height {
                if self.frame.origin.y > superViewHeigt / 2 {
                    snapToTop()
                }else{
                    snapToBottom()
                }
            }
        }
        
    }
    
    func snapToBottom() {
        gravity.gravityDirection = CGVectorMake(0, 2.5)
    }
    
    func snapToTop(){
        gravity.gravityDirection = CGVectorMake(0, -2.5)
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.tintColor = UIColor.clearColor()
        
    }


}
