//
//  ApiRouter.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation
import Alamofire

protocol APIConfiguration: Alamofire.URLRequestConvertible{
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}

enum ApiRouter : APIConfiguration{
    
    //services
    case getPopularMovies()
    case getMovieDetails(movieId : String)
    
    
    //HTTPMethods
    var method: HTTPMethod{
        switch self{
        case .getPopularMovies:
            return HTTPMethod.get
        case .getMovieDetails:
            return HTTPMethod.get
        }
    }
    
    //Endpoints
    var path: String{
        switch self{
        case .getPopularMovies:
            return Constants.Endpoints.popularMovies
        case .getMovieDetails(let movieId):
            return movieId
        }
    }
    
    var parameters: Parameters?{
        switch self{
        case .getPopularMovies:
            return nil
        case .getMovieDetails:
            return nil
        }
    }
    
    
    func asURLRequest() throws -> URLRequest {
        
        var urlRequest : URLRequest
        
        switch self{
            
        case .getPopularMovies, .getMovieDetails:
            let url = try Constants.BaseURL.moviesBaseUrl.asURL()
            urlRequest = URLRequest(url: url.appendingPathComponent(path))
        }
        
        //Set method
        urlRequest.httpMethod = method.rawValue
        
        //Set max timeout time
        urlRequest.timeoutInterval = Constants.ApiConfig.timeoutInterval
        
        //Set headers
        urlRequest.setValue(Constants.ApiConfig.Headers.ContentType.json, forHTTPHeaderField: Constants.ApiConfig.Headers.HTTPHeaderField.contentType )
        
        
        urlRequest.timeoutInterval = Constants.ApiConfig.timeoutInterval
        
        return urlRequest
    }
    
    
}
