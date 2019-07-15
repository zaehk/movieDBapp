//
//  DetailOfMovieViewController.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import UIKit

class DetailOfMovieViewController: BaseViewController, DetailOfMovieViewProtocol {
    
    func enableTrailerButton(movieKey: String) {
        trailerButton.isEnabled = true
        trailerButton.backgroundColor = UIColor.red
        trailerKey = movieKey
    }
    
    func disableTrailerButton() {
        trailerButton.isEnabled = false
        trailerButton.backgroundColor = UIColor.lightGray
    }
    

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var overviewTextView: UITextView!
    @IBOutlet weak var trailerButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    

    var detailOfMovieViewModel : MovieDetailViewModel? = nil
    var landscapeModeImage : UIImage? = nil
    var verticalModeImage : UIImage? = nil
    var trailerKey : String? = nil

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
        self.titleLabel.text = vm.title
        
        MovieImageHelper().downloadImageFromURL(url: vm.backDropPathURL) { (image) in
            self.verticalModeImage = image
            self.updateImageByOrientation()
        }
        MovieImageHelper().downloadImageFromURL(url: vm.posterURL) { (poster) in
            self.landscapeModeImage = poster
            self.updateImageByOrientation()
        }
        disableTrailerButton()
        presenter?.getVideosForMovie(movieId: vm.id)
    }
    
    @IBAction func openTrailer(_ sender: Any) {
        if let key = self.trailerKey{
            let youtubeVC = YoutubePlayerViewController()
            youtubeVC.videoKey = key
            navigationController?.pushViewController(youtubeVC, animated: true)
          //  self.present(youtubeVC, animated: true)
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateGradientSize()
        updateImageByOrientation()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        updateGradientSize()
        updateImageByOrientation()
    }
    
    private func updateImageByOrientation(){
        UIDevice.current.orientation.isLandscape ? setLandscapeImage() : setVerticalImage()
    }
    
    private func setLandscapeImage(){
        if let poster = self.landscapeModeImage{
            self.posterImageView.image = poster
        }
    }
    
    private func setVerticalImage(){
        if let landscapeImage = self.verticalModeImage{
            self.posterImageView.image = landscapeImage
        }
    }
    
    private func updateGradientSize(){
        gradientLayer.frame = posterImageView.bounds
    }
    
    


    private func changePosterDesign(orientation: UIDeviceOrientation){
        
    }

}
