//
//  ViewController.swift
//  Play_Xylophone
//
//  Created by 123 on 14/09/20.
//  Copyright © 2020 vamsiOSDev. All rights reserved.
//

import UIKit
import AVFoundation // FW to play audio and video.

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    
    var player: AVAudioPlayer?
    let danceMoves = ["dance1", "dance2", "dance3", "dance4"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func clickOnInstrumentButton(_ sender: UIButton)
    {
        if let soundToPlay = sender.currentTitle{
            playSound(sound: soundToPlay)
            updateImageViews()
        }
    }
    
    func playSound(sound:String) {
        guard let url = Bundle.main.url(forResource: sound, withExtension: "wav") else { print("failed")
            return }
        
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            player.play()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func updateImageViews() {
        imageView1.image = UIImage(named: danceMoves[Int.random(in: 0...danceMoves.count-1)])
        imageView2.image = UIImage(named: danceMoves[Int.random(in: 0...danceMoves.count-1)])
        imageView3.image = UIImage(named: danceMoves[Int.random(in: 0...danceMoves.count-1)])
    }

}

