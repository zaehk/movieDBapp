//
//  PopularMoviesDomainController.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation

class PopularMoviesDomainController{
    
    private var presenter : PopularMoviesPresenterProtocol
    private var data = PopularMoviesDataController()
    
    init(presenter: PopularMoviesPresenterProtocol){
        self.presenter = presenter
    }
    
    func getPopularMovies(){
        
        data.getPopularMovies(success: { (movieListResponseModel) in

            let domainModel = PopularMoviesDomainModel.init(movieListResponseModel: movieListResponseModel)

            //save in realm
            
            self.presenter.toViewModel(domainModel: domainModel)
            
            
        }) { (dataError) in
            //if api call fails look for local content
        }
    }
    
    func getMovieDetailInfo(){
        
    }
    
}
