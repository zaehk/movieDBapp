//
//  DetailOfMoviePresenter.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation

class DetailOfMoviePresenter : DetailOfMoviePresenterProtocol{
    
    func manageDownloadedTrailers(videoSourcesDM: VideoSourcesDomainModel) {
        if let trailerKey = videoSourcesDM.videoKeys.first{
            view.enableTrailerButton(movieKey: trailerKey)
        }
    }
    
    private var view : DetailOfMovieViewProtocol
    private var domain : DetailOfMovieDomainController?
    
    init(view: DetailOfMovieViewProtocol){
        self.view = view
        self.domain = DetailOfMovieDomainController.init(presenter: self)
    }
    
    func getVideosForMovie(movieId: String){
        domain?.getTrailersForMovie(movieId: movieId)
    }
    
    
}
