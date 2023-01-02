//  ViewController.swift
//  BikeAndCamp
//  Created by serhat yaroglu on 5.11.2022.
import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var name: UILabel!
    var getPopulerPalace = [PopulerPalace]()
    var getTakvim = [takvimInfo]()
    var CampingList = [CampingElement]()

    @IBOutlet weak var PopulerName: UILabel!
    var homePresenterNesnesi:ViewToPresenterHomeProtocol?

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let p1 = PopulerPalace(id: 1, palaceName: "Doga Camping", palaceLocation: "mugla/Fethiye", palacePhoto: "photo1")
        let p2 = PopulerPalace(id: 2, palaceName: "Oludeniz Camping", palaceLocation: "mugla/Fethiye", palacePhoto: "photo2")
        let p3 = PopulerPalace(id: 3, palaceName: "Cennet Camping", palaceLocation: "mugla/bodrum", palacePhoto: "photo3")
        let p4 = PopulerPalace(id: 4, palaceName: "Delikli Camping", palaceLocation: "izmir/alacati", palacePhoto: "photo4")
        let p5 = PopulerPalace(id: 5, palaceName: "Ayder Camping", palaceLocation: "rize/ardesen", palacePhoto: "photo2")
        let p6 = PopulerPalace(id: 6, palaceName: "Rize camping", palaceLocation: "rize", palacePhoto: "photo3")
        getPopulerPalace.append(p1)
        getPopulerPalace.append(p2)
        getPopulerPalace.append(p3)
        getPopulerPalace.append(p4)
        getPopulerPalace.append(p5)
        getPopulerPalace.append(p6)
        let t1 = takvimInfo(id: 1, palaceName: "Doga Camping", palaceDate: "01.03-05.03",palacePhotos: "photo1")
        let t2 = takvimInfo(id: 2, palaceName: "Delikli Camping", palaceDate: "05.03-09.03",palacePhotos: "photo2")
        let t3 = takvimInfo(id: 3, palaceName: "Cennet Camping", palaceDate: "09.03-10.03",palacePhotos: "photo3")
        let t4 = takvimInfo(id: 4, palaceName: "Oludeniz Camping", palaceDate: "10.03-12.03",palacePhotos: "photo4")
        let t5 = takvimInfo(id: 5, palaceName: "Ayder Camping", palaceDate: "10.5-8.6", palacePhotos: "photo3")
        getTakvim.append(t1)
        getTakvim.append(t2)
        getTakvim.append(t3)
        getTakvim.append(t4)
        getTakvim.append(t5)
        collectionView.dataSource = self
        collectionView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.separatorStyle = .none
        sheetPresentationController?.detents = [.medium(),.large()]
        sheetPresentationController?.preferredCornerRadius = 24
        HomeRouter.createModule(ref: self)
        homePresenterNesnesi?.PalaceLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        homePresenterNesnesi?.homeInteractor?.getAllPalace()
    
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sheetDetailViewController"{
            let detailPalace = sender as? takvimInfo
            let toVC = segue.destination as! SheetDetailPalaceVC
            toVC.palaceDetails = detailPalace
        }
        if segue.identifier == "SheetPopulerPalaceDetailVC"{
            let detailPopulerPalace = sender as? PopulerPalace
            let goToVC = segue.destination as! PopulerPalaceDetailVC
            goToVC.populerPalaceDetails = detailPopulerPalace
        }
    }
}

extension ViewController : PresenterToViewHomeProtocol {
    func vieweVeriGonder(CampingList: Array<CampingElement>) {
       self.CampingList = CampingList
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getPopulerPalace.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let getPalace = getPopulerPalace[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "palaceCell", for: indexPath) as! PopulerPalaceCollectionViewCell
        cell.palaceName.text = getPalace.palaceName
       cell.image.image = UIImage(named: "\(getPalace.palacePhoto!)")
        cell.palaceLocationLabel.text = getPalace.palaceLocation
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sendingPopulerPalaceDetail = getPopulerPalace[indexPath.row]
        performSegue(withIdentifier: "SheetPopulerPalaceDetailVC", sender: sendingPopulerPalaceDetail)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
extension ViewController:UITableViewDelegate,UITableViewDataSource,UISheetPresentationControllerDelegate{
    override var sheetPresentationController: UISheetPresentationController?{
        presentationController as? UISheetPresentationController
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getTakvim.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let takvim = getTakvim[indexPath.row]
        let celltable = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath) as! TakvimTableViewCell
        celltable.dateLabel.text = takvim.palaceDate
        celltable.locationImage.image = UIImage(named: "\(takvim.palacePhotos!)")
        celltable.locationNameLabel.text = takvim.palaceName
        return celltable
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sendingDetail = getTakvim[indexPath.row]
        performSegue(withIdentifier: "sheetDetailViewController", sender: sendingDetail)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    }
