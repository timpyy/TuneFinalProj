//
//  InstrumentAdjustmentGuideTableViewController.swift
//  tune-final-project
//
//  Created by Tim Pornyuenyong.
//  Copyright © 2019 Tim Pornyuenyong. All rights reserved.
//
import UIKit

// Supported instruments.
let instruments = ["Saxophone", "Flute", "Clarinet", "Trumpet", "Ukulele", "Guitar", "Violin"]

// Instrument adjustment guide text.
let instrumentGuide = [
    "Before starting any tuning exercises make sure your sax is nicely warmed up.  A cold sax will always sound flat.  Also, if you are practicing in a really cold room you might find that the top of the sax is warm but the bottom is cold. This is going to make your low notes flat, and your top notes sharp!  So if your sax is cold, blow some air through it to get it up to room temperature.  You could also do some long notes to get the whole instrument up to temperature. Pushing your mouthpiece in and out could also change the overall pitch.",
    "Check the cork position in your head joint. It should be somewhere between 17.3 - 18 mm from the center of the embouchure hole. Also make sure that your flute is nice and warm since a cold flute will sound flat. Once this is done, you can also try experimenting with various lip angles. Improper lip angling could affect the sharpness of your flute. Blowing too softly could also result in your flute sounding too flat.",
    "Adjust the length of the tube (aka clarinet) to match your reference. The shorter the length of your tube, the sharper you will be, and vice versa If you are sharp, pull out, if your are flat, push in. Most musicians make these adjustments between the barrel and upper joint, but you can also adjust between the upper and lower joint, or the lower joint and the bell. Make sure to blow air through your clarinet to make it nice and warm, a cold clarinet will tend to sound flatter.",
    "Find your tuning sides. There are four slides on a trumpet that all affect the tuning of your instrument. The main tuning slide is the big one located at the end of your lead pipe opposite of your mouthpiece. The first valve slide comes out toward your mouthpiece from the first valve. The second valve slide extends outward from the middle valve and the third valve slide extends toward the bell from the third valve. Extend the slide if you are sharp and shorten it if your note is flat.",
    "In a standard ukulele, there are four strings corresponding to the following notes: G, C, E, A. Tightening the peg will make the pitch higher, loosening the peg will make the pitch lower.",
    "In a standard guitar, there are six strings corresponding to the following notes in order of thickest string to thinnest string: E, A, D, G, B, E. Always begin tuning from the lowest string up. Tightening the peg will make the pitch higher, loosening the peg will make the pitch lower. If your string is in tune, you should be able to see the string below it vibrate slightly, this is due to the guitar string’s natural frequency.",
    "In a standard violin, there are four strings corresponding to the following notes in order of thickest string to thinnest string: G, D, A, E. The strings of the violin are tightened or loosened to produce the right note by the pegs and the fine tuners. Some violins only have fine tuners on the E string, whereas others have fine tuners on all 4 strings. Fine tuners are used for tuning the string if the string is off-pitch by a small interval of no more than half a tone or so. When the string is out of tune by half a tone or more, then the pegs are used to tune the note."
]

var myIndex = 0

/*
 * View controller for the instrument adjustment guide.
 */
class InstrumentAdjustmentGuideTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return instruments.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = instruments[indexPath.row]
        return cell
    }
    
    /*
     * Open an individual adjustment guide.
     */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "guideSegue", sender: self)
    }
}
