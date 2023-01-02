//
//  HomeRouter.swift
//  BikeAndCamp
//
//  Created by serhat yaroglu on 21.11.2022.
//

import Foundation

class HomeRouter : PresenterToRouterHomeProtocol {
    static func createModule(ref: ViewController) {
        let presenter : ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol = HomePresenter()
        //View controller için
        ref.homePresenterNesnesi = presenter
        //Presenter için
        ref.homePresenterNesnesi?.homeInteractor = HomeInteractor()
        ref.homePresenterNesnesi?.homeView = ref
        //Interactor için
        ref.homePresenterNesnesi?.homeInteractor?.homePresenter = presenter
    }
}
