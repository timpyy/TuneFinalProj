//
//  AKEarTraining.swift
//  tune-final-project
//
//  Created by Aneesh Ashutosh.
//  Copyright © 2019 Aneesh Ashutosh. All rights reserved.
//
import Foundation
import AudioKit

/*
 * AudioKit implementation powering the ear trainer view.
 */
class AKEarTraining {
    let oscBank = AKOscillatorBank()
    var sequencer: AKSequencer!
    let midi = AKMIDI()
    let sequenceLength = AKDuration(beats: 8.0)
    
    /*
     * Initializer. Sets default values for AudioKit.
     */
    init () {
        AKSettings.sampleRate = AudioKit.engine.inputNode.inputFormat(forBus: 0).sampleRate
        oscBank.attackDuration = 0.1
        oscBank.decayDuration = 0.1
        oscBank.sustainLevel = 0.1
        oscBank.releaseDuration = 0.3
    }
    
    /*
     * Chooses a random interval and then calls a helper function to play it.
     */
    func playInterval() -> Interval {
        let freq1 = Interval.notes[Int(arc4random_uniform(UInt32(Interval.notes.count)))]
        let freq2 = Interval.notes[Int(arc4random_uniform(UInt32(Interval.notes.count)))]
        let intervalString = Interval.intervals[abs(Interval.notes.firstIndex(of: freq1)! - Interval.notes.firstIndex(of: freq2)!)]
        
        let interval = Interval(interval: intervalString, note1: freq1, note2: freq2)
        playInterval(interval: interval)
        
        return interval
    }
    
    /*
     * AudioKit logic to play a given interval.
     */
    func playInterval(interval: Interval) {
        // Setup the sequenceer.
        sequencer = AKSequencer()
        let midiNode = AKMIDINode(node: oscBank)
        _ = sequencer.newTrack()
        sequencer.setLength(sequenceLength)
        
        // Remove previous sequence.
        sequencer.tracks[0].clear()
        
        // Add the notes from our interval.
        sequencer.tracks[0].add(
            noteNumber: MIDINoteNumber(interval.getNote1()),
            velocity: 255,
            position: AKDuration(seconds: 0),
            duration: AKDuration(seconds: 1))
        sequencer.tracks[0].add(
            noteNumber: MIDINoteNumber(interval.getNote2()),
            velocity: 255,
            position: AKDuration(seconds: 1),
            duration: AKDuration(seconds: 1))
        
        // Set up AudioKit.
        AudioKit.output = midiNode
        do {
            try AudioKit.start()
        }
        catch {
            print("Unexpected error: \(error).")
        }
        midiNode.enableMIDI(midi.client, name: "midiNode midi in")
        
        // Start playing.
        sequencer.setTempo(120.0)
        sequencer.enableLooping()
        sequencer.play()
    }
    
    /*
     * Stops the sequencer and closes AudioKit. Preparation to reset the ear training process.
     */
    func stop () {
        if (sequencer != nil) {
            sequencer.stop()
        }
        do {
            try AudioKit.stop()
        }
        catch {
            print("Unexpected error: \(error).")
        }
    }
}
