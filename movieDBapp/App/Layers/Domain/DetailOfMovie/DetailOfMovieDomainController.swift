//
//  DetailOfMovieDomainController.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation

class DetailOfMovieDomainController{
    
    private var presenter : DetailOfMoviePresenterProtocol?
        private var data = DetailOfMovieDataController()
    
    init(presenter: DetailOfMoviePresenterProtocol){
        self.presenter = presenter
    }
    
    func getTrailersForMovie(movieId: String, success: @escaping()->Void, failed: @escaping()->Void){
        
        data.getVideoSources(movieId: movieId, success: { (videoSourcesRM) in
            let domainModel = VideoSourcesDomainModel.init(videoSourcesRM: videoSourcesRM)
            
        }) { (movieError) in
            //upload error
        }
        
    }
}
