//
//  ViewController.swift
//  Geely
//
//  Created by Laith Qasem on 14/03/2023.
//

import UIKit

class ViewController: UIViewController {
     // update names
    //MARK: - Outlets
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var MobileNo: UITextField!
    @IBOutlet weak var vehicleNo: UITextField!
    
    //MARK: - Variables
    let defaults = UserDefaults.standard
    var checkFlag = false;

    //MARK: - Actions
    
    @IBAction func login(_ sender: Any) {
        textFieldDefault()
        defaults.set(MobileNo.text, forKey: "MobileNo")
        defaults.set(vehicleNo.text, forKey: "VehicleNo")

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
            checkFlag = true
          
            
        }else{
            sender.setImage(UIImage(named: "check"), for: .normal)
            if (checkFlag == true){
                
                loginBtn.removeSublayer(loginBtn, layerIndex: 0)
                loginBtnDefault()
                checkFlag = false
            }

        }
    }

    func loginBtnDefault (){
        loginBtn.layer.borderColor = UIColor.black.cgColor
        loginBtn.layer.borderWidth = 1
        loginBtn.tintColor = UIColor.black
        loginBtn.layer.cornerRadius = 5
        loginBtn.isEnabled = false
    }
    func textFieldDefault (){
        MobileNo.layer.borderWidth = 1
        MobileNo.layer.cornerRadius = 5
        vehicleNo.layer.borderWidth = 1
        vehicleNo.layer.cornerRadius = 5
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtnDefault()
        textFieldDefault()
        MobileNo.text = defaults.string(forKey: "MobileNo")
        vehicleNo.text = defaults.string(forKey: "VehicleNo")
        
    }
    
    
}

    //MARK: - extensions

extension UIButton {
    
    func applyGradient( colors : [CGColor]) {
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        
        gradientLayer.cornerRadius = layer.cornerRadius
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
        
    }
    func removeSublayer(_ view: UIView, layerIndex index: Int) {
        guard let sublayers = view.layer.sublayers else {
            return
        }
        if sublayers.count > index {
            view.layer.sublayers!.remove(at: index)
        }
    }
    
}

