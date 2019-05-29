//
//  TunerViewController.swift
//  tune-final-project
//
//  Created by Aneesh Ashutosh.
//  Copyright © 2019 Aneesh Ashutosh. All rights reserved.
//

import UIKit
import WMGaugeView
import AudioKit

/*
 * View controller for the tuner view.
 */
class TunerViewController:  UIViewController, UIViewControllerTransitioningDelegate, TunerDelegate {
    fileprivate var tuner: Tuner? // TuningFork
    fileprivate var tunerView: TunerView? // Reference to the TunerView.
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up AudioKit.
        AKSettings.sampleRate = AudioKit.engine.inputNode.inputFormat(forBus: 0).sampleRate
        tunerView = TunerView(frame: view.frame)
        view.addSubview(tunerView!)
        tuner = Tuner()
        tuner?.delegate = self
        
        tuner?.start()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tuner?.stop()
    }

    func tunerDidUpdate(_ tuner: Tuner, output: TunerOutput) {
        // Minimum threshold to ignore
        if output.amplitude < 0.01 {
            tunerView?.gaugeView.value = 0.0
            tunerView?.pitchLabel.text = "--"
        } else {
            // Display pitch
            tunerView?.pitchLabel.text = output.pitch + "\(output.octave)"
            tunerView?.gaugeView.value = Float(output.distance)
        }
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .default
    }
}

