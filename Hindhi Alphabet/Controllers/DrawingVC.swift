//
//  DrawingVC.swift
//  Hindhi Alphabet
//
//  Created by Neal Soni on 8/15/18.
//  Copyright © 2018 Neal Soni. All rights reserved.
//

import UIKit

class DrawingVC: UIViewController {
    
    var letterEnglish: String?
    var letterHindi: String?
    
    @IBOutlet var drawingboard: DrawableView!
    @IBOutlet weak var letterImageView: UIImage!
    @IBOutlet weak var traceLetter: UILabel!
    @IBOutlet weak var navigationBar: UINavigationItem!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        print(letterEnglish, letterHindi)
//        self.drawingboard.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        let imageGen = LetterImageGenerator()
        let image = imageGen.imageWith(name: letterHindi ?? "")
        
        
//        self.view.bringSubview(toFront: drawingboard)
        navigationBar.title = letterEnglish ?? ""
        traceLetter.text = letterHindi ?? ""
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func reset(_ sender: Any) {
        
        drawingboard.reset()
    }
    
    @IBAction func done(_ sender: Any) {
        self.dismiss(animated: true) {
            return true
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
class LetterImageGenerator: NSObject {
    func imageWith(name: String?) -> UIImage? {
        let frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        let nameLabel = UILabel(frame: frame)
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = .lightGray
        nameLabel.textColor = .white
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        var initials = ""
        if let initialsArray = name?.components(separatedBy: " ") {
            if let firstWord = initialsArray.first {
                if let firstLetter = firstWord.characters.first {
                    initials += String(firstLetter).capitalized
                }
            }
            if initialsArray.count > 1, let lastWord = initialsArray.last {
                if let lastLetter = lastWord.characters.first {
                    initials += String(lastLetter).capitalized
                }
            }
        } else {
            return nil
        }
        nameLabel.text = initials
        UIGraphicsBeginImageContext(frame.size)
        if let currentContext = UIGraphicsGetCurrentContext() {
            nameLabel.layer.render(in: currentContext)
            let nameImage = UIGraphicsGetImageFromCurrentImageContext()
            return nameImage
        }
        return nil
    }
}
