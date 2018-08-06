//
//  AlphabetCell.swift
//  Hindhi Alphabet
//
//  Created by Neal Soni on 7/28/18.
//  Copyright © 2018 Neal Soni. All rights reserved.
//

import UIKit

class AlphabetCell: UICollectionViewCell {
    
    @IBOutlet weak var topMargin: NSLayoutConstraint!
    
    @IBOutlet weak var backroundView: UIView!
    @IBOutlet var letter: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 50
        print("init—>Not being called???\n")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
