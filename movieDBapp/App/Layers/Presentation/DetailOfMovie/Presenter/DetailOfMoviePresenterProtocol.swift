//
//  DetailOfMoviePresenterProtocol.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation

protocol DetailOfMoviePresenterProtocol{
    func manageDownloadedTrailers(videoSourcesDM: VideoSourcesDomainModel)
    func manageVideoSourcesError()
}
