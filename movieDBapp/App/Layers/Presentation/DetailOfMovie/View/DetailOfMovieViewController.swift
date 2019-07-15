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
    

    private var presenter : DetailOfMoviePresenter?
    private var gradientLayer : CAGradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = DetailOfMoviePresenter.init(view: self)
        configureViews()
    }
    
    private func configureViews(){
        trailerButton.layer.masksToBounds = true
        trailerButton.layer.cornerRadius = 5
        gradientLayer.frame = posterImageView.bounds // 2
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor] // 3
        gradientLayer.frame = posterImageView.frame
        posterImageView.layer.addSublayer(gradientLayer) // 4
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateGradientSize()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        updateGradientSize()
    }
    
    private func updateGradientSize(){
        gradientLayer.frame = posterImageView.bounds
    }
    
    


    private func changePosterDesign(orientation: UIDeviceOrientation){
        
    }

}
