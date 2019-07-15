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
    case getMovieTrailers(movieId : String)
    
    
    //HTTPMethods
    var method: HTTPMethod{
        switch self{
        case .getPopularMovies,.getMovieTrailers,.getMovieDetails:
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
        case .getMovieTrailers(let movieId):
            return movieId + Constants.Endpoints.trailers
        }
    }
    
    //Parameters
    var parameters: Parameters?{
        //for the moment we only set the apiKey in order to retrieve the info, but in the future we could add more parameters to filter, so we could do a switch in order to personalize them by Api call
            return [ApiParams.ApiKey.apiKey : ApiParams.ApiKey.keyValue]
    }
    
    
    func asURLRequest() throws -> URLRequest {
        
        var urlRequest : URLRequest
        
        let url = try Constants.BaseURL.moviesBaseUrl.asURL()
        
        //Create urlRequest
        urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        //Set method
        urlRequest.httpMethod = method.rawValue
        
        //Set parameters
        urlRequest = try Alamofire.URLEncoding.methodDependent.encode(urlRequest, with: self.parameters)
        
        //Set max timeout time
        urlRequest.timeoutInterval = Constants.ApiConfig.timeoutInterval
        
        //Set headers
        urlRequest.setValue(Constants.ApiConfig.Headers.ContentType.json, forHTTPHeaderField: Constants.ApiConfig.Headers.HTTPHeaderField.contentType )
        
        
        urlRequest.timeoutInterval = Constants.ApiConfig.timeoutInterval
        
        
        return urlRequest
    }
    
    
}
