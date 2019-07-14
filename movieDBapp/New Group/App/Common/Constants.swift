//
//  Constants.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation

struct Constants{
    
    
    struct BaseURL{
        static let moviesBaseUrl = "https://api.themoviedb.org/3/movie/"
    }
    
    struct Endpoints{
        static let popularMovies = "popular"
    }
    
    struct ApiConfig{
        static let timeoutInterval : TimeInterval = 10
        
        struct Headers{
            
            struct HTTPHeaderField{
                static let authentication = "Authorization"
                static let contentType = "Content-Type"
                static let acceptType = "Accept"
                static let acceptEncoding = "Accept-Encoding"
            }
            
            struct ContentType{
                static let json = "application/json"
            }
        }
    }
    
    struct ErrorDescriptions{
        
        struct Realm{
            static let moviesNotInRealm = "There is no local data of movies"
        }
        
        struct Api{
            static let conexionFailed = "There was a problem connecting to the movies server"
            static let parseError = "There was a problem managing the info from the server"
        }
        
    }
    
    
}
