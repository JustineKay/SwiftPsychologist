//
//  ViewController.swift
//  Psychologist
//
//  Created by Justine Kay on 5/31/16.
//  Copyright © 2016 Justine Kay. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController
{
    
    @IBAction func nothingButton(sender: UIButton) {
        performSegueWithIdentifier("showNothingFace", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as? UIViewController
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController
        }
        if let hvc = destination as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "showSadFace": hvc.happiness = 0
                case "showHappyFace": hvc.happiness = 100
                case "showNothingFace": hvc.happiness = 25
                default: hvc.happiness = 50 
                    
                }
            }
        }
    }

}

