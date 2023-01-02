//
//  HomeInteractor.swift
//  BikeAndCamp
//
//  Created by serhat yaroglu on 21.11.2022.
//

import Foundation
import Alamofire
class HomeInteractor : PresenterToInteractorHomeProtocol {
    var homePresenter: InteractorToPresenterHomeProtocol?
    func getAllPalace() {
        AF.request("http://test.evelirafting.com/api/popularplaces",method: .get).responseJSON{ response in
            if let data = response.data{
                do{
                    let response = try JSONDecoder().decode(CampingResponse.self, from: data)
                    var liste = [CampingElement]()
                    if let gelenListe = response.campingElement{
                        liste = gelenListe
                        
                        print("***************************************\(liste)")

                    }
                        self.homePresenter?.presenteraVeriGonder(CampingList: liste)
                }catch{
                    print("hataaaa\(error.localizedDescription)")
                }
            }
        }
    }
}
