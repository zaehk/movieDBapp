//
//  DetailOfMovieDomainModel.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 15/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation

struct DetailsOfMoviesDomainModel{
    var detailOfMovies : [DetailOfMovieDomainModel] = []
    
    init(){
        self.detailOfMovies = []
    }
}

struct DetailOfMovieDomainModel{
    let title : String
    let genres : [Genre]
    let overview : String
    let posterURL : String
    let backDropPathURL: String
    let releaseDate : String
    let runtime : Int
    
    init(detailRM: DetailOfMovieResponseModel){
        self.title = detailRM.title ?? ""
        self.genres = detailRM.genres ?? []
        self.overview = detailRM.overview ?? ""
        self.posterURL = MovieImageHelper.getImageURL(imageEndpoint: detailRM.poster_path ?? "", imageType: .detail)
        self.backDropPathURL = MovieImageHelper.getImageURL(imageEndpoint: detailRM.backdrop_path ?? "", imageType: .listIcon)
        self.releaseDate = detailRM.release_date ?? ""
        self.runtime = detailRM.runtime ?? 0
    }
}
