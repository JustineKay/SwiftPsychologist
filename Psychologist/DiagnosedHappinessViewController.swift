//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by Justine Kay on 5/31/16.
//  Copyright © 2016 Justine Kay. All rights reserved.
//

import Foundation
import UIKit

class DiagnosedHappinessViewController: HappinessViewController, UIPopoverPresentationControllerDelegate
{
    override var happiness: Int {
        didSet {
            diagnosticHistory += [happiness]
        }
    }
    
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    var diagnosticHistory: [Int] {
        get{ return defaults.objectForKey(History.DefaultsKey) as? [Int] ?? [] }
        set{ defaults.setObject(newValue, forKey: History.DefaultsKey) }
    }
    
    private struct History {
        static let SegueIdentifier = "showDiagnosticHistory"
        static let DefaultsKey = "DiagnosedHappinessViewController.History"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case History.SegueIdentifier:
                if let dhvc = segue.destinationViewController as? TextViewController {
                    if let ppc = dhvc.popoverPresentationController {
                        ppc.delegate = self
                    }
                    dhvc.text =  "\(diagnosticHistory)"
                }
            default: break
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
}
