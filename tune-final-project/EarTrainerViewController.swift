//
//  EarTrainerViewController.swift
//  tune-final-project
//
//  Created by Aneesh Ashutosh.
//  Copyright © 2019 Aneesh Ashutosh. All rights reserved.
//
import Foundation
import UIKit
import AudioKit
import DownPicker

/*
 * View controller for the ear trainer view.
 */
class EarTrainerViewController:  UIViewController, UIViewControllerTransitioningDelegate {
    @IBOutlet weak var intervalAnswer: UILabel!  // Reference to the interval answer text field.
    @IBOutlet weak var scoreTextField: UITextField! // Reference to the score text field.
    @IBOutlet weak var dropdownTextField: UITextField! // Reference to the interval picker dropdown.
    
    var intervalString: String = "" // Internal value for the interval answer string.
    var score: Int = 0  // Internal value for the score.
    var dropdown : DownPicker!
    
    var ak : AKEarTraining! // AK implementation.
    
    /*
     * Setup required values.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        dropdown = DownPicker(textField: dropdownTextField, withData: Interval.intervals)
        ak = AKEarTraining()
    }
    
    /*
     * Stops AK when we leave the view.
     */
    override func viewWillDisappear(_ animated: Bool) {
        ak.stop()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .default
    }
    
    /*
     * Handler for pressing the play random interval button.
     * Calls the AK implementation playInterval function and updates the internal interval string.
     */
    @IBAction func playRandomInterval(_ sender: Any) {
        if !AudioKit.engine.isRunning {
            let interval = ak.playInterval()
            intervalString = interval.getInterval()
        }
    }
    
    /*
     * Handler for pressing the check answer button.
     * Updates the score and interval answer text.
     */
    @IBAction func checkAnswer(_ sender: Any) {
        intervalAnswer.text = intervalString
        if (dropdown.text == intervalString) {
            score += 100
        } else {
            score -= 50
        }
        scoreTextField.text = "Score: \(score)"
    }
    
    /*
     * Handler for pressing the reset button.
     * Resets the text and stops the AK implementation.
     */
    @IBAction func reset(_ sender: Any) {
        intervalAnswer.text = ""
        dropdownTextField.text = ""
        ak.stop()
    }
}

