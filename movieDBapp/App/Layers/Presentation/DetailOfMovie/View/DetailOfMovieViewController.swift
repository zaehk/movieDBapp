//
//  DetailOfMovieViewController.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import UIKit

class DetailOfMovieViewController: BaseViewController, DetailOfMovieViewProtocol {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var overviewTextView: UITextView!
    @IBOutlet weak var trailerButton: UIButton!
    

    var detailOfMovieViewModel : MovieDetailViewModel? = nil
    var verticalImage : UIImage? = nil
    var horizontalImage : UIImage? = nil

    private var presenter : DetailOfMoviePresenter?
    private var gradientLayer : CAGradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = DetailOfMoviePresenter.init(view: self)
        if let vm = self.detailOfMovieViewModel{
            loadMovieInfo(vm: vm)
        }
        configureViews()
    }
    
    private func configureViews(){
        trailerButton.layer.masksToBounds = true
        trailerButton.layer.cornerRadius = 5
        gradientLayer.frame = posterImageView.bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.frame = posterImageView.frame
        posterImageView.layer.addSublayer(gradientLayer)
    }
    
    private func loadMovieInfo(vm: MovieDetailViewModel){
        self.dateLabel.text = vm.releaseDate
        self.overviewTextView.text = vm.overview
        self.genresLabel.text = vm.genres.joined(separator: ", ")+"."
        
        MovieImageHelper().downloadImageFromURL(url: vm.backDropPathURL) { (image) in
            self.horizontalImage = image
        }
        MovieImageHelper().downloadImageFromURL(url: vm.posterURL) { (poster) in
            self.verticalImage = poster
        }
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateGradientSize()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        updateGradientSize()
        
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            if UIDevice.current.orientation.isFlat {
                print("Flat")
            } else {
                print("Portrait")
            }
        }
    }
    
    private func updateGradientSize(){
        gradientLayer.frame = posterImageView.bounds
    }
    
    


    private func changePosterDesign(orientation: UIDeviceOrientation){
        
    }

}
