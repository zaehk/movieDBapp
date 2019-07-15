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
        
        data.getVideoSources(movieId: "550", success: { (videoSourcesRM) in
            
        }) { (movieError) in
            //upload error
        }
        
    }
}
