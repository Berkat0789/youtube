//
//  pageMasterCell.swift
//  Youtube
//
//  Created by Berkat Bhatti  on 7/14/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit

class pageMasterCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    @IBOutlet weak var videoCollectionView: UICollectionView!
    var allVideos = [Video]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        videoCollectionView.delegate = self
        videoCollectionView.dataSource = self
        
        Dataservice.instance.fetchVideos { (returnedVideos) in
            self.allVideos = returnedVideos
            self.videoCollectionView.reloadData()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allVideos.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = videoCollectionView.dequeueReusableCell(withReuseIdentifier: "videoCell", for: indexPath) as? videoCell else {return UICollectionViewCell()}
        let video = allVideos[indexPath.row]
        cell.updateCell(video: video)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
