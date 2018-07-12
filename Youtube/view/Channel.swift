//
//  Channel.swift
//  Youtube
//
//  Created by Berkat Bhatti  on 7/12/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit

class Channel: NSObject {
    private(set) public var channelName: String?
    private(set) public var channelProfileImage: String?

    
    init(name: String, ProfileImage: String) {
        self.channelName = name
        self.channelProfileImage = ProfileImage
    }
    
}
