//
//  MoviesDetailsViewModel.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 15/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation

typealias MoviesDetailsViewModel = [MovieDetailViewModel]

struct MovieDetailViewModel{
    let title : String
    var genres : [String] = []
    let overview : String
    let posterURL : String
    let backDropPathURL: String
    let releaseDate : String
    let runtime : String
    
    init(movieDetailVM: DetailOfMovieDomainModel) {
        self.title = movieDetailVM.title
        for genre in movieDetailVM.genres{
            self.genres.append(genre.name)
        }
        self.overview = movieDetailVM.overview
        self.posterURL = movieDetailVM.posterURL
        self.backDropPathURL = movieDetailVM.backDropPathURL
        self.releaseDate = movieDetailVM.releaseDate
        self.runtime = String(movieDetailVM.runtime) + "min"
    }
}
