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
        var channel: Channel?
        let url = URL(string: Video_URLS)
        Alamofire.request(url!).responseString { (response) in
            if let Dict = response.result.value as? Dictionary<String, AnyObject>{
                let title = Dict["title"] as! String
                let numberofViews = Dict["number_of_views"] as! NSNumber
                let thunmnailURL = Dict["thumbnail_image_name"] as! String
              
                if  let channelDict = Dict["channel"] as? Dictionary<String, Any> {
                    let profileURL = channelDict["profile_image_name"] as! String
                    let userName = channelDict["name"] as? String
                    let userchannel = Channel(name: userName!, ProfileImage: profileURL)
                    channel = userchannel
            }
            
                let videos = Video(thumbNail: thunmnailURL, Title: title, channel: channel!, numberofViews: numberofViews)
                allVideos.append(videos)
        }
    }
        completed(allVideos)
    }
}
