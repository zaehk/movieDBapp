//
//  PopularMoviesPresenter.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation

class PopularMoviesPresenter : PopularMoviesPresenterProtocol{
    
    private var view : PopularMoviesViewProtocol
    private var domain : PopularMoviesDomainController?
    
    init(view: PopularMoviesViewProtocol){
        self.view = view
        self.domain = PopularMoviesDomainController.init(presenter: self)
    }
    
}
