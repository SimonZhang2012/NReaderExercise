//
//  ViewController.swift
//  NReaderExercise
//
//  Created by Yixiang Zhang on 23/11/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let url = URL(string: "https://bruce-v2-mob.fairfaxmedia.com.au/1/coding_test/13ZZQX/full")
        let urlSession = URLSession(configuration: .default).dataTask(with: url!) { (data, response, error) in
            if let error = error {
                print(error)
            }
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedObjects = try decoder.decode(RepresentedObject.self, from: data)
                    print(decodedObjects)
                }
                catch DecodingError.typeMismatch(let type, let context) {
                    print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
                }
                catch let myError  {
                    print(myError)
                }
            }
        }
        urlSession.resume()
    }
}

