//
//  DetailOfMovieDataController.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation

class DetailOfMovieDataController{
    
    func getVideoSources(movieId: String, success: @escaping(VideoSourcesResponseModel)->Void, failed: @escaping(MovieAppError)->Void){
        ApiController.makeApiRequest(route: ApiRouter.getMovieTrailers(movieId: movieId), responseModel: VideoSourcesResponseModel.self, success: { (videoSourcesRM) in
            success(videoSourcesRM)
        }) { (movieError) in
            failed(movieError)
        }
    }
    
    
}
