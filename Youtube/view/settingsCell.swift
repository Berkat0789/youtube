//
//  settingsCell.swift
//  Youtube
//
//  Created by Berkat Bhatti  on 7/13/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit

class settingsCell: UICollectionViewCell {
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Hallo there"
        label.textColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nameLabel.frame = self.frame
        addSubview(nameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
