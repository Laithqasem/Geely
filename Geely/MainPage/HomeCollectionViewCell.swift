//
//  HomeCollectionViewCell.swift
//  Geely
//
//  Created by Abd Qasem on 29/03/2023.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var CarName: UILabel!
    @IBOutlet weak var CarImage: UIImageView!
    @IBOutlet weak var CarModel: UILabel!
    
    @IBOutlet weak var VehicleNo: UILabel!
    
    @IBOutlet weak var BatteryPercentage: UILabel!
    
    @IBOutlet weak var ProgressBar: UIProgressView!
    @IBOutlet weak var KmLeft: UILabel!
    
    @IBOutlet weak var CardView: UIView!
    
    @IBOutlet weak var errorBackgroundImage: UIView!
    @IBOutlet weak var NumberOfWarningsLight: UILabel!
    @IBOutlet weak var TimeLeftToFullyCharge: UILabel!
    
    
    func setup(with car: Car) {
        CarImage.image = car.CarPhoto
        CarName.text = car.CarName
        CarModel.text = car.CarModel
        VehicleNo.text = car.CarNumber
        BatteryPercentage.text = String(car.BatteryRemaining)
        KmLeft.text = String(car.KmLeft)
        NumberOfWarningsLight.text = String(car.NumberOfNotification)
        TimeLeftToFullyCharge.text = car.timeLeft
        
        CardView.layer.cornerRadius = 30
        
        errorBackgroundImage.layer.cornerRadius = 20
    //    ProgressBar.backgroundColor = UIColor(named: "bluewhite")
        //ProgressBar.tintColor = UIColor(named: "ToyotaCherryRed")
        ProgressBar.setProgress(Float(abs(car.BatteryRemaining - 100) )/100, animated: true)
        ProgressBar.transform = CGAffineTransformMakeScale(1, 2)
        ProgressBar.layer.cornerRadius = 2

        ProgressBar.applyGradient(colors : [
            UIColor(red: 0.17, green: 0.73, blue: 0.00, alpha: 1.00).cgColor,
            UIColor(red: 0.64, green: 1.00, blue: 0.00, alpha: 1.00).cgColor,
            UIColor(red: 1.00, green: 0.96, blue: 0.00, alpha: 1.00).cgColor,
            UIColor(red: 1.00, green: 0.65, blue: 0.00, alpha: 1.00).cgColor,
            UIColor(red: 1.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
        ] )
 
    }
    
}
extension UIProgressView{
    func applyGradient( colors : [CGColor]) {
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        
        gradientLayer.cornerRadius = layer.cornerRadius
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
        
    }
  
}
