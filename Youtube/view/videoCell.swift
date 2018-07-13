//
//  videoCell.swift
//  Youtube
//
//  Created by berkat bhatti on 7/11/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit

class videoCell: UICollectionViewCell {
    @IBOutlet weak var videothumbImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var channelName: UILabel!
    @IBOutlet weak var channelProfileImage: roundedImage!
    
    func updateCell(video: Video) {
        self.videoTitle.text = video.videoTitle
        self.videothumbImage.image = UIImage(named: video.ThumbnailImage!)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        self.channelName.text = "\(video.videoChannel?.channelName ?? "") • \(numberFormatter.string(from: video.NumberOfViews!) ?? "") • 2 years ago"
        self.channelProfileImage.image = UIImage(named: (video.videoChannel?.channelProfileImage)!)
    }
    
}
