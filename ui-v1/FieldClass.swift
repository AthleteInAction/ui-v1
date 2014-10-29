//
//  FieldClass.swift
//  field-build
//
//  Created by grobinson on 10/27/14.
//  Copyright (c) 2014 wambl. All rights reserved.
//

import UIKit

class FieldClass: UIView {
    
    var p: UIViewController!
    var crossY: UIView!
    var crossX: UIView!
    var ratio: CGFloat!
    var tapCount: Int!
    var touchCount: Int!
    var touchPoint: CGPoint!
    var dist: CGFloat!
    var playLine: CGFloat!
    
    var fdMKR: UIView!
    var losMKR: UIView!
    
    var awaySel: NumberSelector!
    
    init(frame: CGRect,pview: UIViewController,away: NumberSelector) {
        super.init(frame: frame)
        
        p = pview
        awaySel = away
        
        ratio = self.bounds.width/120
        
        crossY = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: self.bounds.height+1))
        crossY.backgroundColor = UIColor.whiteColor()
        crossY.alpha = 0.8
        crossY.hidden = true
        self.addSubview(crossY)
        
        crossX = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.width+1, height: 2))
        crossX.backgroundColor = UIColor.whiteColor()
        crossX.alpha = 0.8
        crossX.hidden = true
        self.addSubview(crossX)
        
        var pan = UIPanGestureRecognizer()
//        pan.addTarget(p, action: "fieldDragged:")
        pan.minimumNumberOfTouches = 1
        pan.maximumNumberOfTouches = 1
        pan.cancelsTouchesInView = false
        self.addGestureRecognizer(pan)
        
        fdMKR = UIView(frame: CGRect(x: yard(40)-10, y: 0, width: 20, height: self.bounds.height))
        var line = UIView(frame: CGRect(x: (fdMKR.bounds.width/2)-2, y: 0, width: 4, height: self.bounds.height))
        line.backgroundColor = UIColor.yellowColor()
        fdMKR.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        fdMKR.addSubview(line)
        fdMKR.alpha = 0.8
        var mkrPan = UIPanGestureRecognizer()
        mkrPan.addTarget(self, action: "mkrDrag:")
        fdMKR.addGestureRecognizer(mkrPan)
        self.addSubview(fdMKR)
        
        losMKR = UIView(frame: CGRect(x: yard(30)-10, y: 0, width: 20, height: self.bounds.height))
        line = UIView(frame: CGRect(x: (losMKR.bounds.width/2)-2, y: 0, width: 4, height: self.bounds.height))
        line.backgroundColor = UIColor.blueColor()
        losMKR.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        losMKR.addSubview(line)
        losMKR.alpha = 0.8
        mkrPan = UIPanGestureRecognizer()
        mkrPan.addTarget(self, action: "mkrDrag:")
        losMKR.addGestureRecognizer(mkrPan)
        self.addSubview(losMKR)
        playLine = losMKR.center.x
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func mkrDrag(item: UIPanGestureRecognizer){
        
        let l: CGPoint = item.locationInView(self)
        
        var new_x = snapX(l.x)
        var one = yard(11)
        var nn = yard(109)
        
        if new_x < one {
            new_x = one
        }
        if new_x > nn {
            new_x = nn
        }
        
        item.view?.center.x = new_x
        
        NSLog("DRAG: x: \(l.x)|y: \(l.y)")
        
    }
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        let t: UITouch = touches.anyObject() as UITouch
        let l: CGPoint = touches.anyObject()!.locationInView(self)
        
        touchPoint = l
        
    }
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        
        let t: UITouch = touches.anyObject() as UITouch
        let l: CGPoint = touches.anyObject()!.locationInView(self)
        
        tapCount = t.tapCount
        touchCount = event.allTouches()?.count
        dist = pixel(abs(l.x - touchPoint.x))
        
        if (tapCount == 1 || tapCount == 2 || tapCount == 3) && touchCount == 1 && dist > 7 {
            
            moveCursor(l)
            
        } else {
            
            hideCursor()
            
        }
        
        NSLog("#\(awaySel.selectedNumber)")
        
    }
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        
        let t: UITouch = touches.anyObject() as UITouch
        let l: CGPoint = touches.anyObject()!.locationInView(self)
        
        if (tapCount == 1 || tapCount == 2 || tapCount == 3) && touchCount == 1 && dist > 7 {
            
            switch tapCount {
            case 2:
                NSLog("PASS")
            case 3:
                NSLog("INTERCEPTION")
            default:
                NSLog("RUN")
                addRun()
            }
            
            moveCursor(l)
            
        } else {
            
            hideCursor()
            
        }
        
        hideCursor()
        
    }
    override func touchesCancelled(touches: NSSet!, withEvent event: UIEvent!) {
        
        hideCursor()
        
    }
    
    
    func yard(x: CGFloat) -> CGFloat {
        
        var pixels = snapX(x * ratio)
        
        return pixels
        
    }
    func pixel(x: CGFloat) -> CGFloat {
        
        var yard = x / ratio
        
        return yard
        
    }
    
    func snapX(x: CGFloat) -> CGFloat {
        
        var snap_x = round(x/ratio)*ratio
        
        return snap_x
        
    }
    
    
    func moveCursor(point: CGPoint){
        
        showCursor()
        
        crossX.center.y = point.y
        if point.y < 10 {
            crossX.center.y = 10
        }
        if point.y > self.bounds.height-10 {
            crossX.center.y = self.bounds.height-10
        }
        
        crossY.center.x = snapX(point.x)
        if pixel(point.x) <= 1 {
            crossY.center.x = yard(1)
        }
        if pixel(point.x) >= 119 {
            crossY.center.x = yard(119)
        }
        
    }
    func hideCursor(){
        
        crossX.hidden = true
        crossY.hidden = true
        
    }
    func showCursor(){
        
        crossX.hidden = false
        crossY.hidden = false
        
    }
    
    
    func addRun(){
        
        var width: CGFloat = crossY.center.x - playLine
        var y: CGFloat = crossX.center.y - 10
        
        if pixel(width + losMKR.center.x) > 110 {
            width = yard(110) - losMKR.center.x
        }
        
        var run = RunClass(frame: CGRect(x: playLine, y: y, width: width, height: 20),pview: p)
        
        var offset = y
        var old_line = UIView(frame: CGRect(x: width-1, y: (-offset), width: 2, height: self.bounds.height))
        
        if pixel(snapX((playLine + width) - 1))%5 == 0  {
            old_line.backgroundColor = UIColor(red: 255.0, green: 0.0, blue: 0.0, alpha: 0.4)
        } else {
            old_line.backgroundColor = UIColor(red: 255.0, green: 0.0, blue: 0.0, alpha: 0.4)
        }
        
        run.addSubview(old_line)
        self.addSubview(run)
        
        playLine = crossY.center.x
        
        downMKRToFront()
        
    }
    
    
    func downMKRToFront(){
        
        self.bringSubviewToFront(fdMKR)
        self.bringSubviewToFront(losMKR)
        
    }
    
}
