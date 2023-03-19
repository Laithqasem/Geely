//
//  ViewController.swift
//  Geely
//
//  Created by Laith Qasem on 14/03/2023.
//

import UIKit

class ViewController: UIViewController {
 
//    @IBOutlet weak var btnImage: UIImageView!
//    //    @IBOutlet weak var btnImage: UIButton!
//    @IBAction func checkBtnChange(_ sender: UIButton) {
////        btnImage.setImage(UIImage(named: "check box"),for: .normal)
//        btnImage.image = UIImage(named: "check")
//    }

    
    
    
    @IBOutlet weak var loginBtn: UIButton!
  
    
    @IBOutlet weak var MobileNo: UITextField!
    @IBOutlet weak var vehicleNo: UITextField!
    
    @IBAction func login(_ sender: Any) {
        let mobileText = MobileNo.text
        
        MobileNo.text = ""
        MobileNo.placeholder = mobileText
        
        let vehicleText = vehicleNo.text
        vehicleNo.text = ""
        vehicleNo.placeholder = vehicleText
        
    }
    
    @IBAction func changeCheckButton(_ sender: UIButton) {
        if sender.currentImage === UIImage(named: "check") {
            sender.setImage(UIImage(named: "check box"), for: .normal)
            loginBtn.isEnabled = true
            loginBtn.applyGradient(colors : [UIColor(red: 0.12, green: 0.50, blue: 0.69, alpha: 1.00).cgColor,UIColor(red: 0.63, green: 0.22, blue: 1.00, alpha: 1.00).cgColor ] )
            loginBtn.tintColor = UIColor.white
            loginBtn.layer.borderColor = UIColor.black.cgColor
            loginBtn.layer.borderWidth = 1
            loginBtn.layer.cornerRadius = 5
            loginBtn.layer.masksToBounds = true
            // UIColor(red: 0.64, green: 0.34, blue: 0.99, alpha: 1.00)
           // UIColor(red: 0.16, green: 0.49, blue: 0.69, alpha: 1.00)
        }else{
            sender.setImage(UIImage(named: "check"), for: .normal)
            loginBtn.isEnabled = false
//            loginBtn.tintColor = UIColor.black

            
        }
    }
    
    //    @IBAction func chg(_ sender: UIButton) {
//
//        if sender.currentImage === UIImage(named: "check") {
//            sender.setImage(UIImage(named: "check box"), for: .normal)
//        }else{
//            sender.setImage(UIImage(named: "check"), for: .normal)
//        }
      
//
//    }
    
    
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.applyGradient(colors : [UIColor(red: 0.12, green: 0.50, blue: 0.69, alpha: 1.00).cgColor,UIColor(red: 0.63, green: 0.22, blue: 1.00, alpha: 1.00).cgColor ] )
        loginBtn.layer.borderColor = UIColor.black.cgColor
        loginBtn.layer.borderWidth = 1
        loginBtn.layer.cornerRadius = 5
        loginBtn.layer.masksToBounds = true
    }
    
    
    
}

extension UIButton {
    
    func applyGradient( colors : [CGColor]) {
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        
        gradientLayer.cornerRadius = layer.cornerRadius
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
        
    }
}
