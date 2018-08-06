//
//  AlphabetVC.swift
//  Hindhi Alphabet
//
//  Created by Neal Soni on 7/28/18.
//  Copyright © 2018 Neal Soni. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class Letter{
    var letter: String?
    var hindi: String?
    var matras: [String: String]?
    var words: [String: String]?

    init (letter: String, hindi: String, matras: [String: String], words: [String: String]){
        self.letter = letter
        self.hindi = hindi
        self.matras = matras
        self.words = words
    }
}
var letters = [String: Letter]()

class AlphabetVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var alphabetEnglish = [["a",   "aa",   "e",    "ee" ],
                           ["u",   "oo",   "ri"],
                           ["ae",  "ai",   "o",    "ow"],
                           ["ang", "aha"],
                           ["ka",  "kha",  "ga",   "gha",  "nga"],
                           ["cha", "chha", "ja",   "jha",  "nya"],
                           ["ta",  "tta",  "dda",  "dha",  "nya"],
                           ["tha", "tha",  "da",   "dhha", "na"],
                           ["pa",  "pha",  "ba",   "bha",  "ma"],
                           ["ya",  "ra",   "la",   "va"],
                           ["sha", "shha", "sa",   "ha"],
                           ["ksha","tra",  "gyan", "shra"]]
    
    var alphabetHindi = [["अ","आ","इ","ई"],
                         ["उ","ऊ","ऋ"],
                         ["ए","ऐ","ओ","औ"],
                         ["अं","अः"],
                         ["क","ख","ग","घ","ङ"],
                         ["च","छ","ज","झ","ञ"],
                         ["ट","ठ","ड","ढ","ण"],
                         ["त","थ","द","ध","न"],
                         ["प","फ","ब","भ","म"],
                         ["य","र","ल","व"],
                         ["श","ष","स","ह"],
                         ["क्ष","त्र","ज्ञ", "श्र"]]
    
    var matras  =       [["", "ा", "ि", "ी",],
                         ["ु", "ू", "ृ","ॠ"],
                         ["े", "ै", "ो", "ौ"],
                         ["ं", "ः"]]
    
    var wordsEH   =     [["anaar", "aam", "imli", "eekh"],
                         ["ulloo", "oon", "rishi"],
                         ["ek", "ainak", "okhali", "aushadhi"],
                         ["angoor", ""],
                         ["kamal", "kargosh", "gadha", "ghar", ""],
                         ["chammach", "chhatri", "jahaaj", "jhanda", ""],
                         ["tamaatar", "thhappa", "damroo", "dhhakkan", ""],
                         ["tarbooz", "tharmas", "dawaat", "dhanush", "nal"],
                         ["patang", "phal", "bakri", "bhaaloo", "makkhi"],
                         ["yagya", "rath", "latoo", "vakeel"],
                         ["shalgam", "shatkon", "santara", "hathi"],
                         ["kshatriya", "trishool", "gyanee", ""]]

    var wordsE    =     [["pomegranate", "mango", "tamarind", "sugar cane"],
                         ["owl", "wool", "saint"],
                         ["one", "spectacles", "mortar", "medicine"],
                         ["grapes", ""],
                         ["lotus", "rabbit", "donkey", "house", ""],
                         ["spoon", "umbrella", "ship", "flag", ""],
                         ["tomato", "stamp", "small drum", "lid", ""],
                         ["watermelon", "vacuum flask", "inkpot", "bow", "tap"],
                         ["kite", "fruits", "goat", "bear", "fly"],
                         ["holy fire", "chariot", "top", "lawyer"],
                         ["turnip", "hexagon", "orange", "elephant"],
                         ["warrior", "trident", "wise man", ""]]
    
    var wordsH    =     [["अनार", "आम", "इमली", "ईख"],
                         ["उल्लू", "ऊन", "ऋषि"],
                         ["एक", "ऐनक", "ओखली", "औषधि"],
                         ["अंगूर", ""],
                         ["कमल", "खरगोश", "गधा", "घर", ""],
                         ["चम्मच", "छतरी", "जहाज", "झंडा", ""],
                         ["टमाटर", "ठप्पा", "डमरू", "ढक्कन", ""],
                         ["तरबूज़", "थरमस", "दावात", "धनुष", "नल"],
                         ["पतंग", "फल", "बाकरी", "भालू", "मक्खी"],
                         ["यज्ञ", "रथ", "लट्टू", "वकील"],
                         ["शलगम", "षटकोण", "संतरा", "हाथी"],
                         ["क्षत्रिय", "त्रिशूल", "ज्ञानी", ""]]
    
    @IBOutlet weak var languageSwitch: UISwitch!
    
    @IBOutlet weak var languageLabel: UILabel!
    
    override func viewDidLoad() {
        
//        for section in (i ... alphabetEnglish.count) {
//            for letter in section{
//                print("letters[\(letter)] = Letter(\(letter), )")
//            }
//        }
        
        let onColor  = UIColor.orange
        languageLabel.text = "Hindi"
        let offColor = UIColor.blue
        /*For on state*/
        languageSwitch.isOn = true
        languageSwitch.onTintColor = onColor
        /*For off state*/
        languageSwitch.tintColor = offColor
        languageSwitch.layer.cornerRadius = languageSwitch.frame.height / 2
        languageSwitch.backgroundColor = offColor
        
        
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    @IBAction func changeLanguage(_ sender: Any) {
        if languageSwitch.isOn { //hindi
            languageLabel.text = "Hindi"
        }else{
            languageLabel.text = "English"
        }
        collectionView?.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return alphabetEnglish.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return alphabetEnglish[section].count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "alphabetCell", for: indexPath) as! AlphabetCell
        // Configure the cell
        
        if languageSwitch.isOn { //Hindi
            cell.letter?.font = UIFont(name: "DevanagariSangamMN", size: 35)
            cell.letter?.text = alphabetHindi[indexPath.section][indexPath.row]
            
            if indexPath.section < 4 {
                cell.topMargin.constant = 0
            }else{
                cell.topMargin.constant = -8
            }
            
        }else{ //english
            cell.topMargin.constant = -8
            let font = UIFont(name: "HelveticaNeue", size: 24)
            let fontAttributes = [NSAttributedStringKey.font: font]
            let width = ((alphabetEnglish[indexPath.section][indexPath.row] as NSString).size(withAttributes: fontAttributes)).width
            print(alphabetEnglish[indexPath.section][indexPath.row], width)
            
            cell.letter?.text = alphabetEnglish[indexPath.section][indexPath.row]
            if (width > 45){
                cell.letter?.font = UIFont(name: "HelveticaNeue", size: 16)
            }else if (width > 35){
                cell.letter?.font = UIFont(name: "HelveticaNeue", size: 20)
            }else{
                cell.letter?.font = UIFont(name: "HelveticaNeue", size: 25)
            }
            cell.letter?.textAlignment = NSTextAlignment.center;
        }
        
        if indexPath.section < 4 {
            cell.backroundView.backgroundColor = UIColor(red:1.00, green:0.65, blue:0.15, alpha:1.0)
        }else{
            cell.backroundView.backgroundColor = UIColor(red:0.81, green:0.58, blue:0.85, alpha:1.0)
        }
//        cell.backgroundView?.layer.cornerRadius = (cell.backgroundView?.layer.frame.width)!/4
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width/7, height: self.view.frame.width/7)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        
        return UIEdgeInsetsMake(8, 5, 8, 5)
        
    }

    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeaders{
                sectionHeader.sectionHeaderlabel.text = "Vowels"
                return sectionHeader
            }
        }
        else if indexPath.section == 3 {
            if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeaders{
                sectionHeader.sectionHeaderlabel.text = "Consonants"
                return sectionHeader
            }
        }else{
            if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeaders{
                sectionHeader.sectionHeaderlabel.text = "Consonants"

                return sectionHeader
            }
        }
        return UICollectionReusableView()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 || section == 4{
            return CGSize(width: collectionView.frame.size.width, height: 40)
        }else{
            return CGSize(width: collectionView.frame.size.width, height: 0)
        }
    }
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
//
//        performSegue(withIdentifier: "showLetter", sender: cell)
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showLetter":
            guard let indexPath = (sender as? UIView)?.findCollectionViewIndexPath() else { return }
            guard let detailViewController = segue.destination as? LetterVC else { return }
            print(alphabetHindi[indexPath.section][indexPath.row],
                  alphabetEnglish[indexPath.section][indexPath.row],
                  wordsE[indexPath.section][indexPath.row],
                  wordsEH[indexPath.section][indexPath.row],
                  wordsH[indexPath.section][indexPath.row])
            detailViewController.hindiLetter = alphabetHindi[indexPath.section][indexPath.row]
            detailViewController.englishLetter = alphabetEnglish[indexPath.section][indexPath.row]
            detailViewController.englishWord = wordsE[indexPath.section][indexPath.row]
            detailViewController.englishHindhiWord = wordsEH[indexPath.section][indexPath.row]
            detailViewController.hindiWord = wordsH[indexPath.section][indexPath.row]
            
        default: return
        }
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

extension UIView {
    
    func findCollectionView() -> UICollectionView? {
        if let collectionView = self as? UICollectionView {
            return collectionView
        } else {
            return superview?.findCollectionView()
        }
    }
    
    func findCollectionViewCell() -> UICollectionViewCell? {
        if let cell = self as? UICollectionViewCell {
            return cell
        } else {
            return superview?.findCollectionViewCell()
        }
    }
    
    func findCollectionViewIndexPath() -> IndexPath? {
        guard let cell = findCollectionViewCell(), let collectionView = cell.findCollectionView() else { return nil }
        
        return collectionView.indexPath(for: cell)
    }
    
}

