//
//  customizeTabBar.swift
//  Geely
//
//  Created by Abd Qasem on 21/03/2023.
//

import UIKit

@IBDesignable
class TabbarController: UITabBarController, UITabBarControllerDelegate{
    
   
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.delegate = self
        changeUnSelectedColor()
        customizeMiddleButton()
        if let indeedTabBarController = self.tabBarController {

            let buttonHeight: CGFloat = 49 // height of tab bar
            let buttonWidth = UIScreen.main.bounds.width / 3 // in case if you have 3 tabs
            let frame = CGRect(x: 0, y: UIScreen.main.bounds.height - buttonHeight, width: buttonWidth, height: buttonHeight)
            let button = UIButton(frame: frame)
            
            indeedTabBarController.view.addSubview(button)
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let selected = tabBarController.viewControllers?.firstIndex(of: viewController)
        if(selected == 0){
            print("Settings")
        }
        if(selected == 1){
            print("Car")
        }
        if(selected == 3){
            print("more")
        }
        if(selected == 4){
            print("Home")
            
        }
    }
    
    func changeUnSelectedColor(){
 
     self.tabBar.unselectedItemTintColor = UIColor(named: "ToyotaCoolGrey")
 
    }
    
    

    
    func customizeMiddleButton() {
        let middleButton = UIButton(frame: CGRect(x: (self.view.bounds.width / 2) - 27.5 , y: -25, width: 55, height: 55))
        
        middleButton.layer.cornerRadius = middleButton.frame.size.width/2
        middleButton.setTitle("24/7", for: .normal)
        middleButton.applyGradient(colors : [UIColor(red: 0.12, green: 0.50, blue: 0.69, alpha: 1.00).cgColor,UIColor(red: 0.63, green: 0.22, blue: 1.00, alpha: 1.00).cgColor ] )

        middleButton.clipsToBounds = true
        
        middleButton.addTarget(self, action: #selector(callButtonFunc), for: .touchUpInside)

        self.tabBar.addSubview(middleButton)
        self.view.layoutIfNeeded()
    }
    
    @objc func callButtonFunc(sender: UIButton!) {
        
        if let url = URL(string: "tel://00970599131062"),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        
    }
    
}

