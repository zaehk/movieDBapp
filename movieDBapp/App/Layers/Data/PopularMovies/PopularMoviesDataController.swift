//
//  PopularMoviesDataController.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import Foundation

class PopularMoviesDataController{
    
    
    func getPopularMovies(success: @escaping(PopularMoviesResponseModel)->Void, failed: @escaping(MovieAppError)->Void){
        ApiController.makeApiRequest(route: ApiRouter.getPopularMovies(), responseModel: PopularMoviesResponseModel.self, success: { (popularMoviesRM) in
            success(popularMoviesRM)
        }) { (movieError) in
            failed(movieError)
        }
    }
    
    private func getDetailOfMovie(movieId: String, success: @escaping(DetailOfMovieResponseModel)->Void, failed: @escaping(MovieAppError)->Void){
        ApiController.makeApiRequest(route: ApiRouter.getMovieDetails(movieId: movieId), responseModel: DetailOfMovieResponseModel.self, success: { (detailOfMovieRM) in
            success(detailOfMovieRM)
        }) { (movieError) in
            failed(movieError)
        }
    }
    
    func getPopularMoviesWithDetail(success: @escaping(MovieListWithInfo)->Void, failed: @escaping(MovieAppError)->Void){
        getPopularMovies(success: { (popularMoviesRM) in
            self.getDetailsOfMovieList(popularMoviesRM: popularMoviesRM, success: { (listWithDetail) in
                success(listWithDetail)
            }, failed: { (movieError) in
                failed(movieError)
            })
        }) { (movieError) in
            failed(movieError)
        }
    }
    
    func getDetailsOfMovieList(popularMoviesRM: PopularMoviesResponseModel, success: @escaping(MovieListWithInfo)->Void, failed: @escaping(MovieAppError)->Void){
        
        let dispatchGroup = DispatchGroup()
        var listAndDetail : MovieListWithInfo = []
        var errorList : [MovieAppError] = []

        if let movieListResults = popularMoviesRM.results{
            
            DispatchQueue.concurrentPerform(iterations: movieListResults.count) { (index) in
                
                let movieId = String(movieListResults[index].id)
                
                dispatchGroup.enter()
                
                getDetailOfMovie(movieId: movieId, success: { (detailOfMovieRM) in
                    listAndDetail.append(MovieListAndDetailModel.init(movieListInfo: movieListResults[index], movieDetailInfo: detailOfMovieRM))
                    dispatchGroup.leave()
                }, failed: { (movieError) in
                    errorList.append(movieError)
                    dispatchGroup.leave()
                })
            }
            
            
            dispatchGroup.notify(queue: DispatchQueue.main){
                
                if errorList.isEmpty && !listAndDetail.isEmpty{
                    success(listAndDetail)
                }else{
                    failed(MovieAppError.apiError(message: "Error retrieving movies details"))
                }
                
            }
        }
    }
}
