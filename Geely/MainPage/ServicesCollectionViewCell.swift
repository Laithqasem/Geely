//
//  ServicesCollectionViewCell.swift
//  Geely
//
//  Created by Abd Qasem on 27/03/2023.
//

import UIKit

class ServicesCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var SeviceName: UILabel!
    @IBOutlet weak var ServiceIcon: UIImageView!
    
    
    func setup(with service: Service) {
        ServiceIcon.image = service.serviceIcon
        SeviceName.text = service.serviceName
    }
    
}
