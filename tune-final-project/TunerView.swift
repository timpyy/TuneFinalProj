//
//  TunerView.swift
//  tune-final-project
//
//  Created by Aneesh Ashutosh.
//  Copyright © 2019 Aneesh Ashutosh. All rights reserved.
//

import Foundation
import UIKit
import WMGaugeView

/*
 * View for the tuner page.
 * Referenced WMGaugeView's sample code to construct this view.
 */
class TunerView: UIView {
    let pitchLabel: UILabel
    let gaugeView: WMGaugeView
    
    fileprivate let titleLabel: UILabel
    fileprivate let pitchTitleLabel: UILabel
    
    /*
     * Initializer
     */
    override init(frame: CGRect) {
        // Format Title
        titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 32, weight: UIFont.Weight.light)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = .center
        titleLabel.text = "ProTune"
        
        // Format WMGaugeView. Code from WMGaugeView starter kit.
        gaugeView = WMGaugeView()
        gaugeView.maxValue = 50.0
        gaugeView.minValue = -50.0
        gaugeView.needleWidth = 0.01
        gaugeView.needleHeight = 0.4
        gaugeView.scaleDivisions = 10
        gaugeView.scaleEndAngle = 270
        gaugeView.scaleStartAngle = 90
        gaugeView.scaleSubdivisions = 5
        gaugeView.showScaleShadow = false
        gaugeView.needleScrewRadius = 0.05
        gaugeView.scaleDivisionsLength = 0.05
        gaugeView.scaleDivisionsWidth = 0.007
        gaugeView.scaleSubdivisionsLength = 0.02
        gaugeView.scaleSubdivisionsWidth = 0.002
        gaugeView.backgroundColor = UIColor.clear
        gaugeView.needleStyle = WMGaugeViewNeedleStyleFlatThin
        gaugeView.needleScrewStyle = WMGaugeViewNeedleScrewStylePlain
        gaugeView.innerBackgroundStyle = WMGaugeViewInnerBackgroundStyleFlat
        gaugeView.scalesubdivisionsaligment = WMGaugeViewSubdivisionsAlignmentCenter
        gaugeView.scaleFont = UIFont.systemFont(ofSize: 0.05, weight: UIFont.Weight.ultraLight)
        
        // Format pitch title
        pitchTitleLabel = UILabel()
        pitchTitleLabel.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.light)
        pitchTitleLabel.adjustsFontSizeToFitWidth = true
        pitchTitleLabel.textAlignment = .center
        pitchTitleLabel.text = "Pitch"
        
        // Format pitch label
        pitchLabel = UILabel()
        pitchLabel.font = UIFont.systemFont(ofSize: 32, weight: UIFont.Weight.light)
        pitchLabel.adjustsFontSizeToFitWidth = true
        pitchLabel.textAlignment = .center
        pitchLabel.text = "--"
        
        super.init(frame: frame)
        
        titleLabel.textColor = rgb(r: 68, g: 84, b: 105)
        pitchTitleLabel.textColor = rgb(r: 68, g: 84, b: 105)
        pitchLabel.textColor = rgb(r: 68, g: 84, b: 105)
        
        addSubview(titleLabel)
        addSubview(gaugeView)
        addSubview(pitchTitleLabel)
        addSubview(pitchLabel)
    }
    
    /*
     * Initializer (redundant, but the app breaks if both of these are not present)
     */
    required init?(coder aDecoder: NSCoder) {
        // Format Title
        titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 32, weight: UIFont.Weight.light)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = .center
        titleLabel.text = "ProTune"
        
        // Format WMGaugeView. Code from WMGaugeView starter kit.
        gaugeView = WMGaugeView()
        gaugeView.maxValue = 50.0
        gaugeView.minValue = -50.0
        gaugeView.needleWidth = 0.01
        gaugeView.needleHeight = 0.4
        gaugeView.scaleDivisions = 10
        gaugeView.scaleEndAngle = 270
        gaugeView.scaleStartAngle = 90
        gaugeView.scaleSubdivisions = 5
        gaugeView.showScaleShadow = false
        gaugeView.needleScrewRadius = 0.05
        gaugeView.scaleDivisionsLength = 0.05
        gaugeView.scaleDivisionsWidth = 0.007
        gaugeView.scaleSubdivisionsLength = 0.02
        gaugeView.scaleSubdivisionsWidth = 0.002
        gaugeView.backgroundColor = UIColor.clear
        gaugeView.needleStyle = WMGaugeViewNeedleStyleFlatThin
        gaugeView.needleScrewStyle = WMGaugeViewNeedleScrewStylePlain
        gaugeView.innerBackgroundStyle = WMGaugeViewInnerBackgroundStyleFlat
        gaugeView.scalesubdivisionsaligment = WMGaugeViewSubdivisionsAlignmentCenter
        gaugeView.scaleFont = UIFont.systemFont(ofSize: 0.05, weight: UIFont.Weight.ultraLight)
        
        // Format pitch title
        pitchTitleLabel = UILabel()
        pitchTitleLabel.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.light)
        pitchTitleLabel.adjustsFontSizeToFitWidth = true
        pitchTitleLabel.textAlignment = .center
        pitchTitleLabel.text = "Pitch"
        
        // Format pitch label
        pitchLabel = UILabel()
        pitchLabel.font = UIFont.systemFont(ofSize: 32, weight: UIFont.Weight.light)
        pitchLabel.adjustsFontSizeToFitWidth = true
        pitchLabel.textAlignment = .center
        pitchLabel.text = "--"
        
        super.init(coder: aDecoder)
        
        titleLabel.textColor = rgb(r: 68, g: 84, b: 105)
        pitchTitleLabel.textColor = rgb(r: 68, g: 84, b: 105)
        pitchLabel.textColor = rgb(r: 68, g: 84, b: 105)
        
        addSubview(titleLabel)
        addSubview(gaugeView)
        addSubview(pitchTitleLabel)
        addSubview(pitchLabel)
    }
    
    /*
     * Recommended layout referenced from WMGaugeView Samples.
     */
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRect(x: 0.0, y: 30, width: bounds.width, height: bounds.height / 18.52)
        gaugeView.frame = CGRect(x: 0, y: ((bounds).height - (bounds).width) / 2.0, width: (bounds).width, height: (bounds).width)
        pitchTitleLabel.frame = CGRect(x: 0, y: gaugeView.frame.origin.y + 0.85 * (gaugeView.bounds).height, width: (bounds).width, height: (bounds).height / 23.82)
        pitchLabel.frame = CGRect(x: 0, y: pitchTitleLabel.frame.origin.y + pitchTitleLabel.frame.height, width: bounds.width, height: bounds.height / 18.52)
    }
    
    /*
     * Helper function
     */
    func rgb(r: Float, g: Float, b: Float) -> UIColor {
        return UIColor(red: CGFloat(r/255.0), green: CGFloat(g/255.0), blue: CGFloat(b/255.0), alpha: 1.0)
    }
}
