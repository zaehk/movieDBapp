//
//  PopularMoviesDataController.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation

class PopularMoviesDataController{
    
    
    func getPopularMovies(success: @escaping(PopularMoviesResponseModel)->Void, failed: @escaping(MovieAppError)->Void){
        ApiController.makeApiRequest(route: ApiRouter.getPopularMovies(), responseModel: PopularMoviesResponseModel.self, success: { (popularMoviesRM) in
            success(popularMoviesRM)
        }) { (movieError) in
            failed(movieError)
        }
    }
}
