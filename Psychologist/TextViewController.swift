//
//  TextViewController.swift
//  Psychologist
//
//  Created by Justine Gartner on 5/31/16.
//  Copyright © 2016 Justine Kay. All rights reserved.
//

import UIKit

class TextViewController: UIViewController
{
    
    @IBOutlet weak var diagnosticHistoryTextView: UITextView! {
        didSet {
            diagnosticHistoryTextView.text = text
        }
    }

    var text: String = "" {
        didSet {
            diagnosticHistoryTextView?.text = text
        }
    }
    
    override var preferredContentSize: CGSize {
        get {
            if diagnosticHistoryTextView != nil && presentingViewController != nil {
                return diagnosticHistoryTextView.sizeThatFits(presentingViewController!.view.bounds.size)
            } else {
                return super.preferredContentSize
            }
        }
        set { super.preferredContentSize = newValue }
    }
}
