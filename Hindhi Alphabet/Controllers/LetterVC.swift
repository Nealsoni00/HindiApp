//
//  LetterVC.swift
//  Hindhi Alphabet
//
//  Created by Neal Soni on 8/5/18.
//  Copyright © 2018 Neal Soni. All rights reserved.
//

import UIKit

class LetterVC: UIViewController {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        header.title = englishLetter ?? ""
        englishWordLabel.text = englishWord ?? ""
        englishHindhiLabel.text = englishHindhiWord ?? ""
        hindiWordLabel.text = hindiWord ?? ""
        hindiLetterLabel.text = hindiLetter ?? ""
        englishLetterLabel.text = englishLetter ?? ""
        print("image: \(englishHindhiWord!).png)")
        image.image = UIImage(named: "\(englishHindhiWord!).png") ?? UIImage()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
