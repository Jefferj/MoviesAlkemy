//
//  MovieListViewController.swift
//  MoviesAlkemy
//
//  Created by Jefferson Naranjo rodríguez on 30/08/22.
//

import UIKit

class MovieListViewController: UIViewController {
    
    private var service = MovieListService()
    private var viewModel: MovieListViewModel?
    
    private lazy var tableView: UITableView = {
        let aTable = UITableView()
        aTable.translatesAutoresizingMaskIntoConstraints = false
        aTable.delegate = self
        aTable.dataSource = self
        view.addSubview(aTable)
        return aTable
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        self.viewModel = MovieListViewModel(service: self.service)
        self.viewModel?.getMovies {
            self.tableView.reloadData()
        }
        

    }
    
    private func setupView() {
        self.view.backgroundColor = UIColor(named: "Background")
        self.navigationController?.navigationBar
            .prefersLargeTitles = true
    }
   
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }

}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected")
    }
}

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel?.movies.count ?? 0 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if let movie = self.viewModel?.movies[indexPath.row] {
            cell.textLabel?.text = movie.title
        }
        return cell
    }
}
//No mostró nada porque la Api falló en el llamado
