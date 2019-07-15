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
    let adult: Bool
    let backdropPath: String
    let belongsToCollection: BelongsToCollection
    let budget: Int
    let genres: [Genre]
    let homepage: String
    let id: Int
    let imdbID, originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath: String
    let productionCompanies: [ProductionCompany]
    let productionCountries: [ProductionCountry]
    let releaseDate: String
    let revenue, runtime: Int
    let spokenLanguages: [SpokenLanguage]
    let status, tagline, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath
        case belongsToCollection
        case budget, genres, homepage, id
        case imdbID
        case originalLanguage
        case originalTitle
        case overview, popularity
        case posterPath
        case productionCompanies
        case productionCountries
        case releaseDate
        case revenue, runtime
        case spokenLanguages
        case status, tagline, title, video
        case voteAverage
        case voteCount
    }
}

// MARK: - BelongsToCollection
struct BelongsToCollection: Codable {
    let id: Int
    let name, posterPath, backdropPath: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case posterPath
        case backdropPath
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

// MARK: - ProductionCompany
struct ProductionCompany: Codable {
    let id: Int
    let logoPath, name, originCountry: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case logoPath
        case name
        case originCountry
    }
}

// MARK: - ProductionCountry
struct ProductionCountry: Codable {
    let iso3166_1, name: String
    
    enum CodingKeys: String, CodingKey {
        case iso3166_1
        case name
    }
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    let iso639_1, name: String
    
    enum CodingKeys: String, CodingKey {
        case iso639_1
        case name
    }
}
