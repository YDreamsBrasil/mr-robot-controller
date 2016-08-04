//
//  StartupController.swift
//  MrRobotControlPad
//
//  Created by Luiz Fonseca on 04/08/2016.
//  Copyright © 2016 Luiz Fonseca. All rights reserved.
//

import Foundation
import UIKit




class StartupController: UIViewController {

    @IBOutlet weak var robotName: UITextField!
    
    @IBOutlet weak var robotServer: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "startConnection") {
            //Checking identifier is crucial as there might be multiple
            // segues attached to same view
            let tab = segue.destinationViewController as! TabController;
            
            tab.robotName = robotName.text
            tab.robotServer = robotServer.text
        }
    }
}