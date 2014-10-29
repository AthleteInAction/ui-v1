//
//  ViewController.swift
//  ui-v1
//
//  Created by grobinson on 10/29/14.
//  Copyright (c) 2014 wambl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var colors = [
        "darkGrey": UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
    ]
    var awayLBL: UIButton!
    var HomeLBL: UIButton!
    
    var awayNumbers: NumberSelector!
    var homeNumbers: NumberSelector!
    
    var field: FieldClass!
    
    var downs = [
        [1,"1st Down"],
        [2,"2nd Down"],
        [3,"3rd Down"],
        [4,"4th Down"],
        ["kickoff","Kickoff"],
        ["pat","PAT"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
       
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testA(){
        
        NSLog("AAAA")
        
    }
    
}