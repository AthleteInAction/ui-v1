//
//  RunClass.swift
//  field-build
//
//  Created by grobinson on 10/28/14.
//  Copyright (c) 2014 wambl. All rights reserved.
//

import UIKit

class RunClass: UIView {
    
    var p: UIViewController!
    
    init(frame: CGRect,pview: UIViewController) {
        super.init(frame: frame)
        
        p = pview
        
        self.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 255.0, alpha: 0.8)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        self.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 180.0, alpha: 0.8)
        
    }
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        
        self.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 255.0, alpha: 0.8)
        
    }
    override func touchesCancelled(touches: NSSet!, withEvent event: UIEvent!) {
        
        self.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 255.0, alpha: 0.8)
        
    }
    
}