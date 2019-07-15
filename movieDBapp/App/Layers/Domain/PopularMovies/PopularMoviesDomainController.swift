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
    
    func getPopularMoviesWithDetail(){
        
        data.getPopularMoviesWithDetail(success: { (listWithDetail) in
            
                        //SAVE IN REALM
            var domainModel = PopularMoviesDomainModel()
            for movieListInfo in listWithDetail{
               domainModel.movies.append(MovieDomainModel.init(movieListInfoRM: movieListInfo.movieListInfo))
            }
            self.presenter.toViewModel(domainModel: domainModel)
            
        }) { (movieError) in
            
            //CHECK FOR REALM LOCAL DATA
            
            //IF NOT, SHOW ERROR
        }
        
        
        
//        data.getPopularMovies(success: { (movieListResponseModel) in
//
//            let domainModel = PopularMoviesDomainModel.init(movieListResponseModel: movieListResponseModel)
//
//            //save in realm
//
//            self.presenter.toViewModel(domainModel: domainModel)
//
//
//        }) { (dataError) in
//            //if api call fails look for local content
//        }
    }
    
}
