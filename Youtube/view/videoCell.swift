//
//  videoCell.swift
//  Youtube
//
//  Created by berkat bhatti on 7/11/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit
import SDWebImage

class videoCell: UICollectionViewCell {
    @IBOutlet weak var videothumbImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var channelName: UILabel!
    @IBOutlet weak var channelProfileImage: roundedImage!
    
    func updateCell(video: Video) {
        self.videoTitle.text = video.videoTitle
        self.videothumbImage.sd_setImage(with: URL(string: video.ThumbnailImage!), placeholderImage: #imageLiteral(resourceName: "taylor_swift_bad_blood"), options: SDWebImageOptions.progressiveDownload, completed: nil)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        self.channelName.text = "\(video.videoChannel?.channelName ?? "") • \(numberFormatter.string(from: video.NumberOfViews!) ?? "") • 2 years ago"
        self.channelProfileImage.sd_setImage(with: URL(string: (video.videoChannel?.channelProfileImage)!), placeholderImage: #imageLiteral(resourceName: "kanye_profile"), options: SDWebImageOptions.progressiveDownload, completed: nil)
    }
    
}
