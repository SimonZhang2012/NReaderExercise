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

    @IBOutlet weak var articlesUICollectionView: UICollectionView!
    var presenter: Presenter?
    let reusedIdentifier = "NReaderCollectionViewCell"
    
    private var displayObjects: [AssetDisplayObject] {
        presenter?.displayAssets ?? []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        articlesUICollectionView.delegate = self
        articlesUICollectionView.dataSource = self
       // articlesUICollectionView.register(NReaderCollectionViewCell.self, forCellWithReuseIdentifier: reusedIdentifier)
    }
        
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        displayObjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusedIdentifier, for: indexPath as IndexPath) as! NReaderCollectionViewCell
        cell.titleLabel.text = displayObjects[indexPath.row].headline

        return cell
    }
    
}

extension ViewController : ViewProtocol {
    func updateView() {
        if let objects = presenter?.displayAssets {
            print(objects)
            DispatchQueue.main.async {
                self.articlesUICollectionView.reloadData()
            }
        }
    }
}

