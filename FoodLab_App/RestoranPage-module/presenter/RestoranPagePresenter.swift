//
//  RestoranPagePresenter.swift
//  FoodLab_App
//
//  Created by Que on 21.10.2022.
//

import Foundation
class RestoranPagePresenter:InteractorToPresenterRestoranPageProtocol,ViewToPresenterRestoranPageProtocol{
    func filterDataToPresener(data: [Restaurant]) {
        restoranPageView?.filterDataToView(data: data)
    }
    
    func filterRest(segmentIndex: Int) {
        restoranPageInteractor?.filterRestI(segmentIndex: segmentIndex)
    }
    
    var restoranPageInteractor: PresenterToInteractorRestoranPageProtocol?
    var restoranPageView: PresenterToViewRestoranPageProtocol?
    
    func dataToPresenter(data: [Restaurant]) {
        restoranPageView?.dataToView(data: data)
    }
    
    func getAllRest() {
        restoranPageInteractor?.getAllRestI()
    }
    

    
}
