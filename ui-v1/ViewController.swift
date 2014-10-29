//
//  ViewController.swift
//  ui-v1
//
//  Created by grobinson on 10/29/14.
//  Copyright (c) 2014 wambl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
    // $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
    @IBOutlet weak var awaySelGD: UIView!
    // $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
    // $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
    
    
    
    // ------------------------------------------------------
    // ------------------------------------------------------
    var colors = [
        "darkGrey": UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
    ]
    var awayLBL: UIButton!
    var HomeLBL: UIButton!
    
    var awayNumbers: NumberSelector!
    var homeNumbers: NumberSelector!
    
    var field: FieldClass!
    
    var downs = [
        [1,"1ST"],
        [2,"2ND"],
        [3,"3RD"],
        [4,"4TH"],
        ["kickoff","KICKOFF"],
        ["pat","PAT"]
    ]
    // ------------------------------------------------------
    // ------------------------------------------------------
    
    
    
    // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNumberSelectors()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    
    // Add Number Selectors
    // ======================================================
    // ======================================================
    func addNumberSelectors(){
        
        awayNumbers = NumberSelector(frame: CGRect(x: awaySelGD.center.x-(awaySelGD.bounds.width/2), y: awaySelGD.center.y-(awaySelGD.bounds.height/2), width: awaySelGD.bounds.width, height: awaySelGD.bounds.height), pview: self)
        view.addSubview(awayNumbers)
        
    }
    // ======================================================
    // ======================================================
    
}