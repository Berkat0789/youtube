//
//  roundedImage.swift
//  Youtube
//
//  Created by berkat bhatti on 7/11/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit
@IBDesignable
class roundedImage: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        updateVIew()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        updateVIew()
    }
    
    
    func updateVIew() {
        self.layer.cornerRadius = self.layer.frame.width / 2
        self.clipsToBounds = true
    }
}
