//
//  InformationViewController.swift
//  MatAppen
//
//  Created by Samantha Morrison on 25/02/11.
//  Copyright © 2017 Samantha Morrison. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    
    var pressedCellNumber : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(pressedCellNumber)"
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
