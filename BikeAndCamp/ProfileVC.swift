//
//  ProfileVC.swift
//  BikeAndCamp
//
//  Created by serhat yaroglu on 9.12.2022.
//

import UIKit

class ProfileVC: UIViewController {
    @IBOutlet weak var buttonImage: UIButton!
    var getProgram = [takvimInfo]()
    var selectedIndex = -1
    var isCoolLapce = false
    var nameArr = ["Programlarim","Gecmis Gezilerim","Profil Ayarlarim"]
    @IBOutlet weak var profileTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let t1 = takvimInfo(id: 1, palaceName: "Doga Camping", palaceDate: "01.03-05.03",palacePhotos: "photo1")
        let t2 = takvimInfo(id: 2, palaceName: "Delikli Camping", palaceDate: "05.03-09.03",palacePhotos: "photo2")
        let t3 = takvimInfo(id: 3, palaceName: "Cennet Camping", palaceDate: "09.03-10.03",palacePhotos: "photo3")
        let t4 = takvimInfo(id: 4, palaceName: "Oludeniz Camping", palaceDate: "10.03-12.03",palacePhotos: "photo4")
        let t5 = takvimInfo(id: 5, palaceName: "Ayder Camping", palaceDate: "10.5-8.6", palacePhotos: "photo3")
        getProgram.append(t1)
        getProgram.append(t2)
        getProgram.append(t3)
        getProgram.append(t4)
        getProgram.append(t5)
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.estimatedRowHeight = 243
        profileTableView.rowHeight = UITableView.automaticDimension

    }
}
extension ProfileVC: UITableViewDelegate,UITableViewDataSource{
    //ecpanding ozelligikullanarak kaydirmali tableview yapildi
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.selectedIndex == indexPath.row && isCoolLapce == true {
            return 243
            
        }else{
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if selectedIndex == indexPath.row{
            if self.isCoolLapce == false{
                self.isCoolLapce = true
               
                
            }else{
                self.isCoolLapce = false
            }
        }else{
            self.isCoolLapce = true
        }
        self.selectedIndex = indexPath.row
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let takvim = getProgram[indexPath.row]
        let celltable = tableView.dequeueReusableCell(withIdentifier: "ScheduleCell", for: indexPath) as! ProfileTableviewCell
        celltable.name.text = takvim.palaceName
        celltable.scheduleImage.image = UIImage(named: "\(takvim.palacePhotos!)")
        celltable.scheduleDate.text = takvim.palaceDate
        celltable.tableviewTabNameLabel.text! = nameArr[indexPath.row]
        return celltable
    }}
