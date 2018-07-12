//
//  HomeVC.swift
//  Youtube
//
//  Created by berkat bhatti on 7/11/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var videosColectionView: UICollectionView!
    @IBOutlet weak var menuCollection: UICollectionView!
    @IBOutlet weak var menuBarContainer: UIView!
    
    var selectedMenuItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videosColectionView.delegate = self
        videosColectionView.dataSource = self
        menuCollection.dataSource = self
        menuCollection.delegate = self
        navigationItem.title = "Home"
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
//        let selectedIndexPath = IndexPath(row: 0, section: 0)
//        menuCollection.selectItem(at: selectedIndexPath, animated: false, scrollPosition: UICollectionViewScrollPosition.left)
        
        //Removes shadow from navigation bar
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        
        

    }
///protocol functions
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == videosColectionView {
            return 1
        }else {
            return 1
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView  == videosColectionView {
            //Video collection
            return 10
        } else {
            return MenuData.instance.returnMenuItems().count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == videosColectionView {
            guard let cell = videosColectionView.dequeueReusableCell(withReuseIdentifier: "videoCell", for: indexPath) as? videoCell else {return UICollectionViewCell()}
            return cell
        } else {
            guard let cell = menuCollection.dequeueReusableCell(withReuseIdentifier: "HomeMenuCell", for: indexPath) as? HomeMenuCell else {return UICollectionViewCell()}
            let menuItem = MenuData.instance.returnMenuItems()[indexPath.row]
            cell.UpdateCell(menu: menuItem)
            return cell

        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == videosColectionView {
            
        } else {
//            let menuItem = MenuData.instance.returnMenuItems()[indexPath.row]
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == videosColectionView {
            return CGSize(width: view.frame.width, height: 300)
        } else {
            return CGSize(width: menuBarContainer.frame.width / 4, height: 46)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == videosColectionView {
            return 0
        } else {
            return 0
        }
    }
    

}
