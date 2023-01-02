//
//  SheetDetailPalaceVC.swift
//  BikeAndCamp
//
//  Created by serhat yaroglu on 6.11.2022.
import UIKit
class SheetDetailPalaceVC: UIViewController,UISheetPresentationControllerDelegate {
    override var sheetPresentationController: UISheetPresentationController?{
        presentationController as? UISheetPresentationController
    }
    var palaceDetails:takvimInfo?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        sheetPresentationController?.detents = [.medium(),.large()]
        sheetPresentationController?.preferredCornerRadius = 24
        // Do any additional setup after loading the view.
        if let palaceDetail = palaceDetails{
            nameLabel.text = palaceDetail.palaceName
            image.image = UIImage(named: "\(palaceDetail.palacePhotos!)")
            
        }
    }
}
