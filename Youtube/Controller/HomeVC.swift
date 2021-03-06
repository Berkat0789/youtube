//
//  HomeVC.swift
//  Youtube
//
//  Created by berkat bhatti on 7/11/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var menuCollection: UICollectionView!
    @IBOutlet weak var menuBarContainer: UIView!
    @IBOutlet weak var horizontalBar: UIView!
    @IBOutlet weak var horizontalBarWidthconstraint: NSLayoutConstraint!
    @IBOutlet weak var horizontalbarLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var pageMasterCollecton: UICollectionView!
    
    var selectedMenuItem: String?
    let blackView = UIView()
    let settingsCollection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let identifier = "CellID"
    let settings = ["Settings", "Terms & conditions", "Send Feedback", "Help", "Switch Accounts"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuCollection.dataSource = self
        menuCollection.delegate = self
        settingsCollection.dataSource = self
        settingsCollection.delegate = self
        pageMasterCollecton.delegate = self
        pageMasterCollecton.dataSource = self
        settingsCollection.register(settingsCell.self, forCellWithReuseIdentifier: identifier)
        setupTitleMenu()
        setupmenuItems()
        setupMenuBar()
        
        
//        let selectedIndexPath = IndexPath(row: 0, section: 0)
//        menuCollection.selectItem(at: selectedIndexPath, animated: false, scrollPosition: UICollectionViewScrollPosition.left)
      

    }
//Selectors/handlers
    @objc func handleSearch() {
    }
    @objc func handleMore () {
        setupSettingsView()
    }
    //Handler
    
    func scrolltoMenuIndex(menuIndex: Int) {
        let indxexPath = IndexPath(row: menuIndex, section: 0)
    pageMasterCollecton.scrollToItem(at: indxexPath, at: UICollectionViewScrollPosition.left, animated: false)
    }
    @objc func handleTaponSettingsView() {
        UIView.animate(withDuration: 0.5) {
           self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
               self.settingsCollection.frame = CGRect(x: 0, y: window.frame.height, width: self.settingsCollection.frame.width, height: self.settingsCollection.frame.height)
            }
        }
    }

///protocol functions
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == menuCollection{
            return 1
        } else if collectionView == settingsCollection{
            return 1
        } else {
            return 1
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         if collectionView == menuCollection{
            return MenuData.instance.returnMenuItems().count
        } else if collectionView == settingsCollection{
            return settings.count
        } else {
            return 4
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == menuCollection {
            guard let cell = menuCollection.dequeueReusableCell(withReuseIdentifier: "HomeMenuCell", for: indexPath) as? HomeMenuCell else {return UICollectionViewCell()}
            let menuItem = MenuData.instance.returnMenuItems()[indexPath.row]
            cell.UpdateCell(menu: menuItem)
            return cell
        } else if collectionView == settingsCollection{
            guard let cell = settingsCollection.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? settingsCell else {return UICollectionViewCell()}
             let setting = settings[indexPath.row]
            cell.nameLabel.text = setting
            return cell
        } else {
            guard let cell = pageMasterCollecton.dequeueReusableCell(withReuseIdentifier: "pageMasterCell", for: indexPath) as? pageMasterCell else {return UICollectionViewCell()}
            let colors: [UIColor] = [UIColor.blue, UIColor.gray, UIColor.orange, UIColor.brown]
            let color = colors[indexPath.row]
            cell.backgroundColor = color
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         if collectionView == menuCollection {
            let x = CGFloat(indexPath.item) * menuBarContainer.frame.width / 4
            horizontalbarLeadingConstraint.constant = x
            scrolltoMenuIndex(menuIndex: indexPath.item)
            UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
            
        } else if collectionView == settingsCollection {
            //Settings cell
        } else {
            //did select page master
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       if collectionView == menuCollection {
            return CGSize(width: menuBarContainer.frame.width / 4, height: 46)
        } else if collectionView == settingsCollection {
            return CGSize(width: view.frame.width, height: 20)
        } else {
            return CGSize(width: view.frame.width, height: view.frame.height)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         if collectionView == menuCollection {
            return 0
        } else if collectionView == settingsCollection {
            return 0
        } else {
            return 0
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        horizontalbarLeadingConstraint.constant = scrollView.contentOffset.x / 4
    }
    //View funstions
    func setupmenuItems() {
        let image: UIImage? = UIImage(named:"search_icon")?.withRenderingMode(.alwaysOriginal)
        let searchItem = UIBarButtonItem(image: image!, style: UIBarButtonItemStyle.plain, target: self, action: #selector(handleSearch))
        let moreImage = UIImage(named: "nav_more_icon")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let moreItem = UIBarButtonItem(image: moreImage, style: UIBarButtonItemStyle.plain, target: self, action: #selector(handleMore))
        navigationItem.rightBarButtonItems = [moreItem, searchItem]
    }
    func setupSettingsView() {
        if let window = UIApplication.shared.keyWindow {
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blackView.alpha = 0
            blackView.frame = window.frame
            window.addSubview(blackView)
            window.addSubview(settingsCollection)
            let height: CGFloat = 250
            let y = window.frame.height - height
            settingsCollection.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            setupSettingsCollecitonAttributes()
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTaponSettingsView)))
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.blackView.alpha = 1
                self.settingsCollection.frame = CGRect(x: 0, y: y, width: self.settingsCollection.frame.width, height: self.settingsCollection.frame.height)
            }, completion: nil)
        
        }
        
    }
    func setupSettingsCollecitonAttributes() {
        settingsCollection.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    func setupMenuBar() {
        horizontalBar.widthAnchor.constraint(equalTo: menuBarContainer.widthAnchor, multiplier: 1/4)

    }
    func setupTitleMenu() {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "  Home"
        titleLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
    }

}
