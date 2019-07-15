//
//  DetailOfMovieDataController.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation

class DetailOfMovieDataController{
    
    private func getVideoSources(movieId: String, success: @escaping(DetailOfMovieResponseModel)->Void, failed: @escaping(MovieAppError)->Void){
        ApiController.makeApiRequest(route: ApiRouter.getMovieDetails(movieId: movieId), responseModel: DetailOfMovieResponseModel.self, success: { (detailOfMovieRM) in
            success(detailOfMovieRM)
        }) { (movieError) in
            failed(movieError)
        }
    }
    
    
}
