//
//  HomeProtocol.swift
//  BikeAndCamp
//
//  Created by serhat yaroglu on 21.11.2022.
//

import Foundation
protocol ViewToPresenterHomeProtocol {
    var homeInteractor:PresenterToInteractorHomeProtocol? {get set}
    var homeView:PresenterToViewHomeProtocol? {get set}
    
    func PalaceLoad()
}

protocol PresenterToInteractorHomeProtocol {
    var homePresenter:InteractorToPresenterHomeProtocol? {get set}
    
    func getAllPalace()
}
protocol InteractorToPresenterHomeProtocol {
    func presenteraVeriGonder(CampingList: Array<CampingElement>)
}

protocol PresenterToViewHomeProtocol {
    func vieweVeriGonder(CampingList: Array<CampingElement>)
}

protocol PresenterToRouterHomeProtocol {
    static func createModule(ref:ViewController)
}
