//
//  Interval.swift
//  tune-final-project
//
//  Created by Aneesh Ashutosh.
//  Copyright © 2019 Aneesh Ashutosh. All rights reserved.
//
import Foundation

/*
 * Container class for a given interval.
 */
class Interval {
    // Index of each term corresponds to the distance.
    static let intervals = ["Unison", "Augmented Unison", "Major Second", "Augmented Second", "Major Third", "Perfect Fourth", "Augmented Fourth", "Perfect Fifth", "Augmented Fifth", "Major Sixth", "Augmented Sixth", "Major Seventh", "Octave"]
    // MIDI note values for the 4th octave.
    static let notes = [60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72]
    
    var interval: String?
    var note1: Int?
    var note2: Int?
    
    init(interval: String, note1: Int, note2: Int) {
        self.interval = interval
        self.note1 = note1
        self.note2 = note2
    }
    
    func getInterval() -> String {
        return interval!
    }
    
    func getNote1() -> Int {
        return note1!
    }
    
    func getNote2() -> Int {
        return note2!
    }
}
