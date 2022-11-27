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
    @IBOutlet weak var articlesTableView: UITableView!
    var presenter: Presenter?
    
    private var displayObjects: [AssetDisplayObject] {
        presenter?.displayAssets ?? []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        articlesTableView.delegate = self
        articlesTableView.dataSource = self
    }
        
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        displayObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        let cell = UITableViewCell()
        cell.textLabel?.text = displayObjects[indexPath.row].headline
        
        
        return cell
    }
    
    
}

extension ViewController : ViewProtocol {
    func updateView() {
        if let objects = presenter?.displayAssets {
            print(objects)
            DispatchQueue.main.async {
                self.articlesTableView.reloadData()
            }
        }
    }
}

