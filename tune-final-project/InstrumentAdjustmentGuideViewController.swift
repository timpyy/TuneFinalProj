//
//  InstrumentAdjustmentGuideViewController.swift
//  tune-final-project
//
//  Created by Tim Pornyuenyong.
//  Copyright © 2019 Tim Pornyuenyong. All rights reserved.
//
import UIKit

/*
 * View controller for an instrument adjustment guide page.
 */
class InstrumentAdjustmentGuideViewController: UIViewController {
    @IBOutlet weak var instrumentName: UILabel! // Reference for the instrument name field.
    @IBOutlet weak var instrumentDesc: UILabel! // Reference for the instrument text field.
    @IBOutlet weak var myImageView: UIImageView! // Reference for the instrument image field.
    
    /*
     * Load the required data into the view for the instrument.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        instrumentName.text = instruments[myIndex]
        instrumentDesc.text = instrumentGuide[myIndex]
        myImageView.image = UIImage(named: instruments[myIndex] + ".jpg")
    }
}
