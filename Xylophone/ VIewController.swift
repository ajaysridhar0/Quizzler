//
//  ViewController.swift
//  Xylophone
//


import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    var audioPlayer : AVAudioPlayer!
    let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    var selectedSoundFileName : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // this IBAction can differentiate between different buttions with the tag
    @IBAction func notePressed(_ sender: UIButton) {
        selectedSoundFileName = soundArray[sender.tag - 1]
        playSound()
    }
    
    func playSound() {
        // sets up URL location of the sound URL
        let soundURL = Bundle.main.url(forResource: selectedSoundFileName, withExtension: "wav")
        do {
            // tries to initilize the audio player with sound URL
            try audioPlayer =  AVAudioPlayer(contentsOf: soundURL!)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
    }

}

