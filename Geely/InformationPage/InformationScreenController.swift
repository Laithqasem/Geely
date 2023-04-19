//
//  InformationScreenController.swift
//  Geely
//
//  Created by Abd Qasem on 17/04/2023.
//

import UIKit

class InformationScreenController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    

    @IBOutlet weak var navBar: UIView!
    @IBOutlet weak var FirstTableView: UITableView!


    //AuthorizedCenterSevicesCell
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirstTableView.dataSource = self
        FirstTableView.delegate = self
        
        
        
        navBar.layer.shadowRadius = 4
        navBar.layer.shadowOpacity = 0.5
        navBar.layer.shadowOffset = CGSize(width: 0, height: 7)
        navBar.layer.shadowColor = dropShadow.cgColor
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        authorizedCenterServices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FirstTableView.dequeueReusableCell(withIdentifier: "AuthorizedCenterSevicesCell", for: indexPath ) as! ServicesTableViewCell
        
        cell.setupCell(icon: authorizedCenterServices[indexPath.row].serviceIcon, serviceName: authorizedCenterServices[indexPath.row].serviceName)
        
        return cell;
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }

}
