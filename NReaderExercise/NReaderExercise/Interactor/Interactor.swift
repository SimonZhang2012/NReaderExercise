//
//  Interactor.swift
//  NReaderExercise
//
//  Created by Yixiang Zhang on 27/11/2022.
//

import Foundation

protocol InteractorProtocol {
    var data: RepresentedObject? { get }
    func initialSetup()
   
    // These are not required in this exercise, could be for next step.
//    func restoreData()
//    func saveDataToLocalStorage()
//    func restoreDataFromLocalStorage()
}

/// Interactor holds all 'Business Logic', in this app mainly: read data from an URL and decode it.

public class Interactor: InteractorProtocol {
    weak var presenter: PresenterProtocol?
    private(set) var data: RepresentedObject?
    
    func initialSetup() {
        data = nil
        fetchExerciseData()
    }
    
    private func fetchExerciseData() {
        let url = URL(string: "https://bruce-v2-mob.fairfaxmedia.com.au/1/coding_test/13ZZQX/full")
        let urlSession = URLSession(configuration: .default).dataTask(with: url!) { (data, response, error) in
            if let error = error {
                self.presenter?.interactorDidUpdateData(result: .failure(error))
            }
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedObjects = try decoder.decode(RepresentedObject.self, from: data)
                    self.data = decodedObjects
                    self.presenter?.interactorDidUpdateData(result: .success(decodedObjects))
                    print(decodedObjects)
                }
                catch let error  {
                    print(error)
                    self.presenter?.interactorDidUpdateData(result: .failure(error))
                }
            }
        }
        urlSession.resume()
    }    
}
