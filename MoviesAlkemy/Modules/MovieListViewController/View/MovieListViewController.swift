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
        aTable.register(MoviesTableViewCell.self, forCellReuseIdentifier: String(describing: MoviesTableViewCell.self))
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
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            if !UserDefaults.standard.isUserLoggedIn {
                let loginVC = LoginViewController()
                loginVC.modalPresentationStyle = .fullScreen
                self.present(loginVC, animated: false)
            }
        }
    
    private func setupView() {
        self.title = "Movie List"
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logOut))
           }
   
    private func setupConstraints (){
            NSLayoutConstraint.activate([
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                tableView.topAnchor.constraint(equalTo: view.topAnchor)
            ])
        }
    
    @objc private func logOut() {
            UserDefaults.standard.isUserLoggedIn = false
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: false)
        }
        
    }



extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel?.getMovie(at: indexPath.row, onComplete: { movie in
            let vc = MovieDetailViewController()
            vc.movieURL = movie.title
            self.navigationController?.pushViewController(vc, animated: true)
        })
    }
}

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel?.movies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MoviesTableViewCell.self), for: indexPath) as? MoviesTableViewCell else {
            return UITableViewCell()
        }
        if let movie = self.viewModel?.movies[indexPath.row] {
            cell.name = movie.title
        }
        return cell
    }
}
