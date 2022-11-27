//
//  UIImageView+loadImage.swift
//  NReaderExercise
//
//  Created by Yixiang Zhang on 27/11/2022.
//

import Foundation
import UIKit

var imageCache = NSCache<AnyObject, AnyObject>()

// Here demo a simple way to use in-memory cache to fetch image
// We can also use the code in AppDelegate

extension UIImageView {

    func loadImage(urlString: String) {
        
        if let existingCacheImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = existingCacheImage
            return
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Couldn't download image at \(url.absoluteString) : \(error.localizedDescription)")
                return
            }
            guard let data = data, let image = UIImage(data: data) else {
                print("Couldn't get image data at \(url.absoluteString)")
                return
            }
            
            imageCache.setObject(image, forKey: urlString as AnyObject)
            
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}
