//
//  ImageURLBuilder.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation
import UIKit

enum MovieImageType{
    case listIcon
    case detail
    
    var baseURL : String{
        switch self{
            
        case .listIcon:
            return Constants.BaseURL.listIconBaseUrl
        case .detail:
            return Constants.BaseURL.movieDetailImageBaseUrl
        }
    }
}

class MovieImageHelper{
    
    
    
    static func getImageURL(imageEndpoint: String, imageType: MovieImageType)-> URL?{
        return URL(string: imageType.baseURL+imageEndpoint)
    }
    
    let cellIconCache = NSCache<NSString, UIImage>()
    
    func downloadImageFromURL(url: String, completion: @escaping (UIImage?)->Void){
        
        // check if icon is already in cache
        if let cachedIcon = cellIconCache.object(forKey: url as NSString){
            completion(cachedIcon)
        }else{
            let parsedURL = URL(string: url)
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: parsedURL!)
                DispatchQueue.main.async {
                    if let imageData = data{
                        // if icon is succesfully downloaded is saved in cache
                        self.cellIconCache.setObject(UIImage(data: imageData)!, forKey: url as NSString)
                        completion(UIImage(data: imageData))
                    }
                }
            }
            completion(nil)}
    }
    
}
