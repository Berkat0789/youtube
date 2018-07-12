//
//  HomeMenuCell.swift
//  Youtube
//
//  Created by Berkat Bhatti  on 7/11/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit

class HomeMenuCell: UICollectionViewCell {
    @IBOutlet weak var menuImage: UIImageView!
    
    
    override var isHighlighted: Bool {
        didSet {
            menuImage.tintColor = isHighlighted ? UIColor.blue : UIColor.black
        }
    }
    override var isSelected: Bool {
        didSet {
            menuImage.tintColor = isHighlighted ? UIColor.blue : UIColor.black
        }
    }

    func UpdateCell(menu: MenuItem) {
        self.menuImage.image = menu.menuImage
    }
}
