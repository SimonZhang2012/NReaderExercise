//
//  ViewController.swift
//  NReaderExercise
//
//  Created by Yixiang Zhang on 23/11/2022.
//

import UIKit
import SafariServices

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

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        displayObjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusedIdentifier, for: indexPath as IndexPath) as! NReaderCollectionViewCell
        cell.titleLabel.text = displayObjects[indexPath.row].headline

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size: CGFloat = (collectionView.frame.size.width - space) / 2.0
        
        return CGSizeMake(size, 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = displayObjects[indexPath.row]
        if let url = URL(string: item.url) {
            let config = SFSafariViewController.Configuration()
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
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

