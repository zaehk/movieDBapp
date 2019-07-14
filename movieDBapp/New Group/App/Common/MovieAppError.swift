//
//  MovieAppError.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation

enum MovieAppError: LocalizedError{
    
    case apiError(message: String)
    case moviesNotFoundInRealm
    case parseError
    
    public var errorDescription: String?{
        switch self{
        case .apiError(let message):
            return message
        case .moviesNotFoundInRealm:
            return Constants.ErrorDescriptions.Realm.moviesNotInRealm
        case .parseError:
            return Constants.ErrorDescriptions.Api.parseError
        }
    }
}
