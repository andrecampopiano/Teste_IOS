//
//  HTMCustomImageView.swift
//  Teste_iOS
//
//  Created by André Campopiano on 31/03/17.
//  Copyright © 2017 André Campopiano. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class HTMCustomImageView: UIImageView {
    
        var imageUrlString: String?
        
        func loadImageUsingUrlString(_ urlString: String) {
            
            imageUrlString = urlString
            
            let url = URL(string: urlString)
            
            image = nil
            
            if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
                self.image = imageFromCache
                return
            }
            
            URLSession.shared.dataTask(with: url!, completionHandler: { (data, respones, error) in
                
                if let err = error{
                    print(err)
                    return
                }
                
                DispatchQueue.main.async(execute: {
                    
                    let imageToCache = UIImage(data: data!)
                    
                    if self.imageUrlString == urlString {
                        self.image = imageToCache
                    }
                    
                    imageCache.setObject(imageToCache!, forKey: urlString as NSString)
                })
                
            }).resume()
        }
    
}

