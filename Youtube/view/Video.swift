//
//  Video.swift
//  Youtube
//
//  Created by Berkat Bhatti  on 7/12/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit

class Video: NSObject {
    private(set) public var ThumbnailImage: String?
    private(set) public var videoTitle: String?
    private(set) public var videoChannel: Channel?
    private(set) public var NumberOfViews: NSNumber?
    private(set) public var DateUploaded: NSDate?




    init(thumbNail: String, Title: String, channel: Channel, numberofViews: NSNumber) {
        self.ThumbnailImage = thumbNail
        self.videoTitle = Title
        self.videoChannel = channel
        self.NumberOfViews = numberofViews
    }
}
