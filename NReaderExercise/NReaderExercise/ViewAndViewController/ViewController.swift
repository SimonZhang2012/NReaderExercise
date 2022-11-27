//
//  ViewController.swift
//  NReaderExercise
//
//  Created by Yixiang Zhang on 23/11/2022.
//

import UIKit

protocol ViewProtocol : AnyObject {
    func updateView()
}

class ViewController: UIViewController {

    var presenter: Presenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
        
}

extension ViewController : ViewProtocol {
    func updateView() {
    }
}

