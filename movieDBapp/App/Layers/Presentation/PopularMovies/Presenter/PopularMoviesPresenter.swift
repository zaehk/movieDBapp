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
    
    func toViewModel(domainModel: PopularMoviesDomainModel) {
        var viewModel : PopularMoviesViewModel = []
        for model in domainModel.movies{
            viewModel.append(MovieViewModel.init(popularMoviesDomainModel: model))
        }
        returnVMtoView(viewModel: viewModel)
    }
    
    private func returnVMtoView(viewModel: PopularMoviesViewModel){
        view.showMovieList(productListVM: viewModel)
    }
    
    func getPopularMovieList(){
        domain?.getPopularMoviesWithDetail()
    }

}
