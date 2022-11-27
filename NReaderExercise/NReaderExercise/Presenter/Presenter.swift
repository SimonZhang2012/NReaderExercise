//
//  Presenter.swift
//  NReaderExercise
//
//  Created by Yixiang Zhang on 27/11/2022.
//

import Foundation

struct AssetDisplayObject {
    let headline: String
    let theAbstract: String
    let byLine: String
    let timeStamp: Double
    let url: String
}

protocol PresenterProtocol : AnyObject  {
    func interactorDidUpdateData(result: Result<Int, Error>)
}

class Presenter : PresenterProtocol {

    
    private var interactor : InteractorProtocol
    weak var view: ViewProtocol?
    private(set) var displayAssets = [AssetDisplayObject]()
    
    init(interactor: Interactor) {
        self.interactor = interactor
        interactor.presenter = self
    }
    
    func interactorDidUpdateData(result: Result<Int, Error>) {
        switch result {
        case .success:
            if let data = interactor.data {
                displayAssets = data.assets.map {
                    AssetDisplayObject(headline: $0.headline,
                                       theAbstract: $0.theAbstract,
                                       byLine: $0.byLine,
                                       timeStamp: $0.timeStamp,
                                       url: $0.url)
                }
            }
            view?.updateView()
            break;
        case .failure(let error):
            view?.displayError(error.localizedDescription)
            break;
        }

        
    }
}
