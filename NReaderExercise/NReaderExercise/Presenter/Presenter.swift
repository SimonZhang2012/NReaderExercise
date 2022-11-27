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
    
    let imageURL: String
}

protocol PresenterProtocol : AnyObject  {
    func interactorDidUpdateData(result: Result<RepresentedObject, Error>)
}

class Presenter : PresenterProtocol {

    
    private var interactor : InteractorProtocol
    weak var view: ViewProtocol?
    private(set) var displayAssets = [AssetDisplayObject]()
    
    init(interactor: Interactor) {
        self.interactor = interactor
        interactor.presenter = self
    }
    
    func interactorDidUpdateData(result: Result<RepresentedObject, Error>) {
        switch result {
        case .success:
            if let data = interactor.data {
                // Sort the data by timeStamp, then compose the display data for view 
                displayAssets = data.assets.sorted(by: { $0.timeStamp > $1.timeStamp })
                    .map {
                        var imageURL = ""
                        if let images = $0.relatedImages.sorted(by: {$0.width < $1.width}).first(where: { $0.width > 0}) {
                            imageURL = images.url
                        }
                        return AssetDisplayObject(headline: $0.headline,
                                                  theAbstract: $0.theAbstract,
                                                  byLine: $0.byLine,
                                                  timeStamp: $0.timeStamp,
                                                  url: $0.url,
                                                  imageURL: imageURL)
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
