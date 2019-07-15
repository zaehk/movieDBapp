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
    
    func getTrailersForMovie(movieId: String){
        
        data.getVideoSources(movieId: movieId, success: { (videoSourcesRM) in
            let domainModel = VideoSourcesDomainModel.init(videoSourcesRM: videoSourcesRM)
            self.presenter?.manageDownloadedTrailers(videoSourcesDM: domainModel)
        }) { (movieError) in
            self.presenter?.manageVideoSourcesError()
        }
        
    }
}
