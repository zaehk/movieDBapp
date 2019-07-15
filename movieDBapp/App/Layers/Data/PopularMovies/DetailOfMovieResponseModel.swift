//
//  DetailOfMovieResponseModel.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 15/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct DetailOfMovieResponseModel: Codable {
    let adult: Bool?
    let backdrop_path: String?
    let budget: Int?
    let genres: [Genre]?
    let homepage: String?
    let id: Int?
    let overview: String?
    let popularity: Double?
    let poster_path: String?
    let release_date: String?
    let revenue, runtime: Int?
    let status, tagline, title: String?
    let video: Bool?
    let vote_average: Double?
    let vote_count: Int?
}

// MARK: - Genre
struct Genre : Codable {
    let id: Int
    let name: String
}
