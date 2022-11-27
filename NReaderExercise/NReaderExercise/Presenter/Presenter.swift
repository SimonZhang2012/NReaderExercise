//
//  Presenter.swift
//  NReaderExercise
//
//  Created by Yixiang Zhang on 27/11/2022.
//

import Foundation

protocol PresenterProtocol : AnyObject  {
    func interactorDidUpdateData()
}

class Presenter : PresenterProtocol {
    private var interactor : InteractorProtocol
  //  weak var view: ViewProtocol?
    
    init(interactor: Interactor) {
        self.interactor = interactor
        interactor.presenter = self
    }
    
    func interactorDidUpdateData() {
//        view?.updateView()
    }
}
