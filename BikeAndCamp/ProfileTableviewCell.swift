//
//  ProfileTableviewCell.swift
//  BikeAndCamp
//
//  Created by serhat yaroglu on 9.12.2022.
//

import UIKit

class ProfileTableviewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var buttonImage: UIButton!
    @IBOutlet weak var tableviewTabNameLabel: UILabel!
    @IBOutlet weak var scheduleDate: UILabel!
    @IBOutlet weak var scheduleImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
