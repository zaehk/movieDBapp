//
//  MovieListAndDetailModel.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 15/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation

typealias MovieListWithInfo = [MovieListAndDetailModel]

struct MovieListAndDetailModel{
    let movieListInfo : MovieListInfo
    let movieDetailInfo : DetailOfMovieResponseModel
}
