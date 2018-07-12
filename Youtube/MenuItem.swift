//
//  MenuItem.swift
//  Youtube
//
//  Created by Berkat Bhatti  on 7/11/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import Foundation
import UIKit


class MenuItem {
    
    private(set) public var menuImage: UIImage?
    private(set) public var menuTitle: String?
    
    
    init(menuImage:UIImage, menuTitle: String) {
        self.menuImage = menuImage
        self.menuTitle = menuTitle
    }
    
}
