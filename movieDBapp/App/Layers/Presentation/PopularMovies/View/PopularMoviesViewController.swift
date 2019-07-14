//
//  PopularMoviesViewController.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import UIKit

class PopularMoviesViewController: BaseViewController, PopularMoviesViewProtocol {

    
    private var presenter : PopularMoviesPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = PopularMoviesPresenter.init(view: self)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
