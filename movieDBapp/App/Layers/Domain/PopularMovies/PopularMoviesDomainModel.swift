//
//  PopularMoviesDomainModel.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation

struct PopularMoviesDomainModel{
    var movies : [MovieDomainModel] = []
    
    init(movieListResponseModel: PopularMoviesResponseModel){
        if let moviesRM = movieListResponseModel.results{
            for movie in moviesRM{
                self.movies.append(MovieDomainModel.init(movieListInfoRM: movie))
            }
        }else{
            self.movies = []
        }
    }
}

struct MovieDomainModel{
    let id: Int
    let voteAverage: Double
    let title: String
    let posterURL: String
    let releaseDate: String
    
    init(movieListInfoRM: MovieListInfo){
        self.id = movieListInfoRM.id
        self.voteAverage = movieListInfoRM.vote_average
        self.title = movieListInfoRM.title
        self.posterURL = MovieImageHelper.getImageURL(imageEndpoint: movieListInfoRM.poster_path, imageType: .listIcon)
        self.releaseDate = movieListInfoRM.release_date
    }
}
