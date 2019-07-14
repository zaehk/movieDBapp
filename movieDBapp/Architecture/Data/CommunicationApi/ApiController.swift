//
//  CommunicationController.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation
import Alamofire

class ApiController{
    
    private static var AFManager : Alamofire.SessionManager = {
        
        var serverTrustPolicies: [String: ServerTrustPolicy] = [:]
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        let manager = Alamofire.SessionManager(configuration: configuration,
                                               serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies))
        return manager
    }()
    
    
    
    
    static func makeApiRequest<T:Decodable>(route: ApiRouter, responseModel: T.Type, success: @escaping(T)->Void, failed: @escaping(MovieAppError)->Void){
        
        AFManager.request(route).validate(statusCode: 200..<300).responseData { (response) in
            
            switch response.result{
                
            case .success(_):
                guard let data = response.data
                    else{
                        return
                }
                do{
                    let jsonDecoder = JSONDecoder()
                    let responseObject = try jsonDecoder.decode(responseModel.self, from: data)
                    success(responseObject)
                }catch{
                    failed(MovieAppError.parseError)
                }
            case .failure(let error):
                failed(MovieAppError.apiError(message: error.localizedDescription))
            }
        }
    }
    
    
}
