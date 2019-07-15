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
    
    func toViewModel(listDomainModel: PopularMoviesDomainModel, detailsDomainModel: DetailsOfMoviesDomainModel) {
        var listViewModel : PopularMoviesViewModel = []
        var detailsViewModel : MoviesDetailsViewModel = []
        
        
        for model in listDomainModel.movies{
            listViewModel.append(MovieViewModel.init(popularMoviesDomainModel: model))
        }
        for detail in detailsDomainModel.detailOfMovies{
            detailsViewModel.append(MovieDetailViewModel.init(movieDetailDM: detail))
        }
        
        returnVMtoView(listViewModel: listViewModel, detailViewModel: detailsViewModel)
    }
    
    private func returnVMtoView(listViewModel: PopularMoviesViewModel, detailViewModel: MoviesDetailsViewModel){
        view.showMovieList(productListVM: listViewModel, detailViewModel: detailViewModel)
    }
    
    func getPopularMovieList(){
        domain?.getPopularMoviesWithDetail()
    }
    
    func manageError(error: MovieAppError) {
        view.showInfoError(error: error)
    }

}
