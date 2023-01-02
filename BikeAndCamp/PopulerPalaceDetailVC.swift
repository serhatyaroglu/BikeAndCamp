//
//  PopulerPalaceDetailVC.swift
//  BikeAndCamp
//
//  Created by serhat yaroglu on 16.11.2022.
//

import UIKit

class PopulerPalaceDetailVC: UIViewController,UISheetPresentationControllerDelegate {
    override var sheetPresentationController: UISheetPresentationController?{ presentationController as? UISheetPresentationController
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    var populerPalaceDetails:PopulerPalace?
    override func viewDidLoad() {
        super.viewDidLoad()
        sheetPresentationController?.detents = [.medium(),.large()]
        sheetPresentationController?.preferredCornerRadius = 25
        if let popularPalace = populerPalaceDetails{
            nameLabel.text = popularPalace.palaceName
            image.image = UIImage(named: "\(popularPalace.palacePhoto!)")
        }
        
    }
    

}
