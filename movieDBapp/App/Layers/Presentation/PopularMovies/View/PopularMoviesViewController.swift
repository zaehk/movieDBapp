//
//  PopularMoviesViewController.swift
//  movieDBapp
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/07/2019.
//  Copyright © 2019 Borja Saez de Guinoa Vilaplana. All rights reserved.
//

import UIKit

class PopularMoviesViewController: BaseViewController {

    //MARK: - Views
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    private var popularMoviesViewModel : PopularMoviesViewModel = []{
        didSet{
            self.tableView.reloadData()
        }
    }
    
    private var detailsOfMoviesViewModel : MoviesDetailsViewModel = []
    
    private var presenter : PopularMoviesPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = PopularMoviesPresenter.init(view: self)
        configureViews()
        getMovieList()
    }
    
    private func configureViews(){
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib.init(nibName: PopularMoviesCell.nibName, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: PopularMoviesCell.nibName)
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = 100
    }
    
    private func getMovieList(){
        showSpinner()
        presenter?.getPopularMovieList()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Segues.detailOfMovieSegue {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! DetailOfMovieViewController
                controller.detailOfMovieViewModel = self.detailsOfMoviesViewModel[indexPath.row]
            }
        }
    }
    
}

//MARK: - ViewProtocol
extension PopularMoviesViewController : PopularMoviesViewProtocol{
    
    
    func showMovieList(productListVM: PopularMoviesViewModel, detailViewModel: MoviesDetailsViewModel) {
        hideSpinner()
        self.popularMoviesViewModel = []
        self.popularMoviesViewModel = productListVM
        self.detailsOfMoviesViewModel = []
        self.detailsOfMoviesViewModel = detailViewModel
    }
    
}

//MARK: - TableView setup
extension PopularMoviesViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popularMoviesViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PopularMoviesCell.nibName) as! PopularMoviesCell
        cell.setup(movieInfo: popularMoviesViewModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismissKeyboard()
        performSegue(withIdentifier: Constants.Segues.detailOfMovieSegue, sender: nil)
    }
}

//MARK: - SearchBar
extension PopularMoviesViewController : UISearchBarDelegate{
    
}
