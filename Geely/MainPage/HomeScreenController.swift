//
//  HomeScreenController.swift
//  Geely
//
//  Created by Abd Qasem on 21/03/2023.
//

import UIKit

class HomeScreenController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    //Mark: - Outlets
    @IBOutlet weak var notificationsNumber: UILabel!
    
    @IBOutlet weak var notificationNumberView: UIView!
    
    @IBOutlet weak var notificationBtn: UIButton!
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    @IBOutlet weak var navBarView: UIView!
    
    
   
    //Mark: - functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return services.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServicesCollectionViewCell", for: indexPath) as! ServicesCollectionViewCell
        cell.setup(with: services[indexPath.row])
        cell.backgroundColor = UIColor.white
 
                cell.layer.cornerRadius = 20
                cell.layer.shadowColor = dropShadow.cgColor
                cell.layer.shadowOffset = CGSize(width: 0, height: 0)
                cell.layer.shadowRadius = 20
                cell.layer.shadowOpacity = 1
                cell.layer.masksToBounds = false //<-
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.3, height: self.view.frame.width * 0.3 + 8)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 12, bottom: 8, right: 12)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        CollectionView.dataSource = self
        CollectionView.delegate = self
        CollectionView.semanticContentAttribute = .forceRightToLeft
        if let layout = CollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            
        }
        
        navBarView.layer.shadowRadius = 4
        navBarView.layer.shadowOpacity = 0.2
        navBarView.layer.shadowOffset = CGSize(width: 0, height: 7)
        navBarView.layer.shadowColor = dropShadow.cgColor
        
        notificationNumberView.backgroundColor = UIColor(named: "NiceBlue")
        notificationNumberView.layer.cornerRadius = 10
        notificationBtn.layer.shadowColor = dropShadow.cgColor
        notificationBtn.layer.shadowRadius = 8
        notificationBtn.layer.shadowOpacity = 1
        notificationBtn.layer.shadowOffset = CGSize(width: 1, height: 1)
    }
    
    
}


var dropShadow: UIColor {
        return UIColor(red: 228 / 255.0, green: 235 / 255.0, blue: 240 / 255.0, alpha: 1.0)
    }
