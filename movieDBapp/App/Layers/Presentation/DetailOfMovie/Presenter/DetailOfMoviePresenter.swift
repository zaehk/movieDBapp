//
//  DetailOfMoviePresenter.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation

class DetailOfMoviePresenter : DetailOfMoviePresenterProtocol{
    
    private var view : DetailOfMovieViewProtocol
    private var domain : DetailOfMovieDomainController?
    
    init(view: DetailOfMovieViewProtocol){
        self.view = view
        self.domain = DetailOfMovieDomainController.init(presenter: self)
    }
    
    
}
