//
//  PopularMoviesViewProtocol.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation

protocol PopularMoviesViewProtocol : BaseViewProtocol{
    func showMovieList(productListVM: PopularMoviesViewModel, detailViewModel: MoviesDetailsViewModel)
}
