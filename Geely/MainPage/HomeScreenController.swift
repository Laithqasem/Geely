//
//  HomeScreenController.swift
//  Geely
//
//  Created by Abd Qasem on 21/03/2023.
//

import UIKit

class HomeScreenController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
   
    //Mark: - Outlets
    //MARK: - Outlets
    @IBOutlet weak var notificationsNumber: UILabel!
    @IBOutlet weak var pageControlSlider: UIPageControl!
    @IBOutlet weak var notificationNumberView: UIView!
    @IBOutlet weak var notificationBtn: UIButton!
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var HomeScrollView: UIScrollView!
    @IBOutlet weak var CarCollectionView: UICollectionView!
    
    //MARK: - Variables
    var numberofservices = 5
    
    //MARK: - functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == CarCollectionView){
            return Cars.count // variables shouls start with small letters
        }
        return numberofservices
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var servicesForCar = services
        if(collectionView == CarCollectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
            // add if let car = Cars[indexPath.row] or guard
            cell.setup(with: Cars[indexPath.row])
            pageControlSlider.currentPage = indexPath.row
            print(indexPath.row)

            numberofservices = Cars[indexPath.row].Services.count
            servicesForCar = Cars[indexPath.row].Services
            
            print("------------")

            // move to cell 
            cell.layer.shadowRadius = 20
            cell.layer.cornerRadius = 20
            cell.layer.masksToBounds = false
            
            return cell
        
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServicesCollectionViewCell", for: indexPath) as! ServicesCollectionViewCell
        
                cell.setup(with: servicesForCar[indexPath.row])

                self.CollectionView.reloadData()
                cell.backgroundColor = UIColor.white
 
        // move these values
                cell.layer.cornerRadius = 20
                cell.layer.shadowColor = dropShadow.cgColor
                cell.layer.shadowOffset = CGSize(width: 0, height: 0)
                cell.layer.shadowRadius = 20
                cell.layer.shadowOpacity = 1
                cell.layer.masksToBounds = false //<-
        return cell
    }
    
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(collectionView == CarCollectionView){
            return CGSize(width: self.view.frame.width * 0.98, height: self.view.frame.width + 20)
        }
        return CGSize(width: self.view.frame.width * 0.3, height: self.view.frame.width * 0.3 + 8)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if(collectionView == CarCollectionView){
            return 0
        }
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if(collectionView == CarCollectionView){
            
            return UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 8)
        }
        return UIEdgeInsets(top: 0, left: 6, bottom: 8, right: 6)
    }
  
    // MARK: - LifeCycle
    // read about application life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // move these to setupCollectionView method
        CollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        CollectionView.dataSource = self
        CollectionView.delegate = self
        CollectionView.semanticContentAttribute = .forceRightToLeft
        if let layout = CollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            
        }
        CollectionView.backgroundView = nil;
     
        CarCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        CarCollectionView.dataSource = self
        CarCollectionView.delegate = self
        CarCollectionView.semanticContentAttribute = .forceRightToLeft
        if let layout = CarCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
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
        
        pageControlSlider.numberOfPages = Cars.count

    }

}


// add extension for all colors you need
var dropShadow: UIColor {
        return UIColor(red: 228 / 255.0, green: 235 / 255.0, blue: 240 / 255.0, alpha: 1.0)
    }



// add extention for collection view delegates
