//
//  PopularMoviesResponseModel.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation

struct PopularMoviesResponseModel : Decodable {
    let page, totalResults, totalPages: Int?
    let results: [MovieListInfo]?
}

// MARK: - Result
struct MovieListInfo : Decodable {
    let vote_count: Int?
    let id: Int
    let video: Bool?
    let vote_average: Double?
    let title: String
    let popularity: Double?
    let poster_path: String?
    let original_language: String?
    let original_title: String?
    let genre_ids: [Int]?
    let backdrop_path: String?
    let adult: Bool?
    let overview, release_date: String?
}


