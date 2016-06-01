//
//  ViewController.swift
//  Psychologist
//
//  Created by Justine Gartner on 5/31/16.
//  Copyright © 2016 Justine Kay. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController
{
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let hvc = segue.destinationViewController as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "showSadFace": hvc.happiness = 0
                case "showHappyFace": hvc.happiness = 100
                default: hvc.happiness = 50 
                    
                }
            }
        }
    }

}

