//
//  ServicesTableViewCell.swift
//  Geely
//
//  Created by Abd Qasem on 17/04/2023.
//

import UIKit

class ServicesTableViewCell: UITableViewCell {
    @IBOutlet weak var ServiceName: UILabel!
    @IBOutlet weak var ServiceIcon: UIImageView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func setupCell(icon: UIImage, serviceName: String){
        ServiceIcon.image = icon
        ServiceName.text = serviceName
 
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
