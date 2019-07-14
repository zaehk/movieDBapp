//
//  PopularMoviesViewController.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import UIKit

class PopularMoviesViewController: BaseViewController, PopularMoviesViewProtocol {

    //MARK: - Views
    @IBOutlet weak var tableView: UITableView!
    
    
    
    private var popularMoviesViewModel : PopularMoviesViewModel = []{
        didSet{
            self.tableView.reloadData()
        }
    }
    
    private var presenter : PopularMoviesPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = PopularMoviesPresenter.init(view: self)
        // Do any additional setup after loading the view.
    }
    
    private func configureViews(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    
}

//MARK: - TableView setup
extension PopularMoviesViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popularMoviesViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
