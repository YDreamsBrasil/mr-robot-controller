//
//  FirstViewController.swift
//  MrRobotControlPad
//
//  Created by Luiz Fonseca on 04/08/2016.
//  Copyright © 2016 Luiz Fonseca. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    
    override func viewDidLoad() {

        if let tbc = self.tabBarController as? TabController {

            tbc.sendFeedbackMessage("Hello World")
        }
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

