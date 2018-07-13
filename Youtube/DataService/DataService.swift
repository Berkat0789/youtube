//
//  DataService.swift
//  Youtube
//
//  Created by Berkat Bhatti  on 7/12/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit
import Alamofire

class Dataservice {
    static let instance = Dataservice()
    
    
    //Func to get videos
    
    func fetchVideos(completed: @escaping (_ video: [Video]) -> ()) {
        var allVideos = [Video]()
        let url = URL(string: Video_URLS)
        Alamofire.request(url!).responseJSON { (response) in
            if let Dict = response.result.value as? [Dictionary<String, AnyObject>] {
                for videos in Dict {
                    let title = videos["title"] as! String
                    let numberofViews = videos["number_of_views"] as! NSNumber
                    let thumbnail = videos["thumbnail_image_name"] as! String
                 //Get channel for videos
                    let channel = videos["channel"] as! Dictionary<String, AnyObject>
                    let name = channel["name"] as! String
                    let profileImage = channel["profile_image_name"] as! String
                    
                    let chann = Channel(name: name, ProfileImage: profileImage)
                    let video = Video(thumbNail: thumbnail, Title: title, channel: chann, numberofViews: numberofViews)
                    
                    allVideos.append(video)
                }
        }
        completed(allVideos)
    }
        
   }
    
    
    
    
}
