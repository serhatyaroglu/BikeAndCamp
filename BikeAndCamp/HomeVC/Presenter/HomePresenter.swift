//
//  HomePresenter.swift
//  BikeAndCamp
//
//  Created by serhat yaroglu on 21.11.2022.
//

import Foundation

class HomePresenter : ViewToPresenterHomeProtocol {
    var homeInteractor: PresenterToInteractorHomeProtocol?
    var homeView: PresenterToViewHomeProtocol?
    
    func PalaceLoad() {
        homeInteractor?.getAllPalace()
    }
  
}

extension HomePresenter : InteractorToPresenterHomeProtocol {
    func presenteraVeriGonder(CampingList: Array<CampingElement>) {
        homeView?.vieweVeriGonder(CampingList: CampingList)
    }
}
