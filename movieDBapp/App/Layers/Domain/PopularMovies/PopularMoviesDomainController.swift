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
            var movieListDomainModel = PopularMoviesDomainModel()
            var moviesDetailsDomainModel = DetailsOfMoviesDomainModel()
            
            for movieInfo in listWithDetail{
               movieListDomainModel.movies.append(MovieDomainModel.init(movieListInfoRM: movieInfo.movieListInfo))
                moviesDetailsDomainModel.detailOfMovies.append(DetailOfMovieDomainModel.init(detailRM: movieInfo.movieDetailInfo, id: String(movieInfo.movieListInfo.id)))
            }
            
            self.presenter.toViewModel(listDomainModel: movieListDomainModel, detailsDomainModel: moviesDetailsDomainModel)

        }) { (movieError) in
            self.presenter.manageError(error: movieError)
        }
    }
}
