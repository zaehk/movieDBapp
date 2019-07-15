//
//  PopularMoviesViewModel.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation

typealias PopularMoviesViewModel = [MovieViewModel]

struct MovieViewModel{
    let id: Int
    let voteAverage: Double
    let title: String
    let posterURL: String
    let releaseDate: String
    
    init(popularMoviesDomainModel: MovieDomainModel){
        self.id = popularMoviesDomainModel.id
        self.voteAverage = popularMoviesDomainModel.voteAverage
        self.title = popularMoviesDomainModel.title
        self.posterURL = popularMoviesDomainModel.posterURL
        self.releaseDate = popularMoviesDomainModel.releaseDate
    }
}
