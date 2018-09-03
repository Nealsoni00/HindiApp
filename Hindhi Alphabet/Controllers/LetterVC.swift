//
//  LetterVC.swift
//  Hindhi Alphabet
//
//  Created by Neal Soni on 8/5/18.
//  Copyright © 2018 Neal Soni. All rights reserved.
//

import UIKit
import AVFoundation

class LetterVC: UIViewController, AVSpeechSynthesizerDelegate {
    
    
    var englishWord: String?
    var englishHindhiWord: String?
    var hindiWord: String?
    var hindiLetter: String?
    var englishLetter: String?
    @IBOutlet weak var header: UINavigationItem!
    @IBOutlet weak var englishWordLabel: UILabel!
    @IBOutlet weak var englishHindhiLabel: UILabel!
    @IBOutlet weak var hindiWordLabel: UILabel!
    @IBOutlet weak var hindiLetterLabel: UILabel!
    @IBOutlet weak var englishLetterLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    let speakTalk   = AVSpeechSynthesizer()
    let speechSynthesizer = AVSpeechSynthesizer()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        speechSynthesizer.delegate = self
//        for voice in (AVSpeechSynthesisVoice.speechVoices()){
//            print(voice.language)
//        }
        let speakMsg    = AVSpeechUtterance(string: hindiLetter ?? "")
        speakMsg.voice  = AVSpeechSynthesisVoice(language: "hi-IN")
        speakMsg.pitchMultiplier = 1.2
        speakMsg.rate   = 0.1
        speakTalk.speak(speakMsg)

        
        header.title = englishLetter ?? ""
        englishWordLabel.text = englishWord ?? ""
        englishHindhiLabel.text = englishHindhiWord ?? ""
        hindiWordLabel.text = hindiWord ?? ""
        hindiLetterLabel.text = hindiLetter ?? ""
        englishLetterLabel.text = englishLetter ?? ""
        print("image: \(englishHindhiWord!).png)")
        image.image = UIImage(named: "\(englishHindhiWord!).png") ?? UIImage()
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(playWord)))
        hindiLetterLabel.isUserInteractionEnabled = true
        hindiLetterLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(playHindiLetter)))
        englishLetterLabel.isUserInteractionEnabled = true
        englishLetterLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(playHindiLetter)))
        englishHindhiLabel.isUserInteractionEnabled = true
        englishHindhiLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(playWord)))
        hindiWordLabel.isUserInteractionEnabled = true
        hindiWordLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(playWord)))

        // Do any additional setup after loading the view.
    }
    @objc private func playWord(_ recognizer: UITapGestureRecognizer) {
        let speakMsg    = AVSpeechUtterance(string: hindiWord ?? "")
        
        speakMsg.voice  = AVSpeechSynthesisVoice(language: "hi-IN")
        speakMsg.pitchMultiplier = 1.2
        speakMsg.rate   = 0.35
        
        speakTalk.speak(speakMsg)
    }
    @objc private func playHindiLetter(_ recognizer: UITapGestureRecognizer) {
        print("pressed letter")
        let speakMsg    = AVSpeechUtterance(string: hindiLetter ?? "")
        
        speakMsg.voice  = AVSpeechSynthesisVoice(language: "hi-IN")
        speakMsg.pitchMultiplier = 1.2
        speakMsg.rate   = 0.1
        
        speakTalk.speak(speakMsg)
    }
   
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "draw":
            
            let drawingVC = segue.destination as? DrawingVC
         
            drawingVC?.letterHindi = hindiLetter
            drawingVC?.letterEnglish = englishLetter
        default: return

        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
