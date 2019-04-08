//
//  ViewController.swift
//  Xylophone
//
//  Created by Michael Gimara on 24/03/2019.
//  Copyright © 2019 Michael Gimara. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        playSound(named: "note\(sender.tag)")
    }
    
    func playSound(named soundName: String) {
        if let audioPlayer = audioPlayer,
           audioPlayer.isPlaying {
            audioPlayer.stop()
        }
        
        guard let soundURL = Bundle.main.url(forResource: soundName, withExtension: "wav")
        else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        } catch let error { 
            print(error.localizedDescription)
        }
    }
}

