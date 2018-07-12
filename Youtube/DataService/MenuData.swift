//
//  MenuData.swift
//  Youtube
//
//  Created by Berkat Bhatti  on 7/11/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import Foundation
import UIKit

class MenuData {
    static let instance = MenuData()
    
    
    private var HomeMenu = [
        MenuItem(menuImage: UIImage(named: "home")!, menuTitle: "Trending"),
        MenuItem(menuImage: UIImage(named: "trending")!, menuTitle: "Top"),
        MenuItem(menuImage: UIImage(named: "subscriptions")!, menuTitle: "Live"),
        MenuItem(menuImage: UIImage(named: "account")!, menuTitle: "News")
    ]
    
    func returnMenuItems() -> [MenuItem] {
        return HomeMenu
    }
}
