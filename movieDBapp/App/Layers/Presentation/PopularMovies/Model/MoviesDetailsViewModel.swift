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
    let id : String
    let title : String
    var genres : [String] = []
    let overview : String
    let posterURL : String
    let backDropPathURL: String
    let releaseDate : String
    let runtime : String
    
    init(movieDetailDM: DetailOfMovieDomainModel) {
        self.id = movieDetailDM.id
        self.title = movieDetailDM.title
        for genre in movieDetailDM.genres{
            self.genres.append(genre.name)
        }
        self.overview = movieDetailDM.overview
        self.posterURL = movieDetailDM.posterURL
        self.backDropPathURL = movieDetailDM.backDropPathURL
        self.releaseDate = movieDetailDM.releaseDate
        self.runtime = String(movieDetailDM.runtime) + "min"
    }
}
