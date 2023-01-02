//
//  Data.swift
//  BikeAndCamp
//
//  Created by serhat yaroglu on 5.11.2022.
//

import Foundation
class PopulerPalace{
    var id:Int?
    var palaceName:String?
    var palaceLocation:String?
    var palacePhoto:String?
    init(){}
    init(id:Int?,palaceName:String?,palaceLocation:String?,palacePhoto:String?){
        self.id = id
        self.palaceName = palaceName
        self.palaceLocation = palaceLocation
        self.palacePhoto = palacePhoto
        
    }
}
class takvimInfo{
    var id:Int?
    var palaceName:String?
    var palaceDate:String?
    var palacePhotos:String?
    init(){}
    init(id:Int?,palaceName:String?,palaceDate:String?,palacePhotos:String?){
        self.id = id
        self.palaceName = palaceName
        self.palaceDate = palaceDate
        self.palacePhotos = palacePhotos
        
    }
}
