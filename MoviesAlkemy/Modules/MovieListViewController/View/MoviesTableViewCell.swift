//
//  MoviesTableViewCell.swift
//  MoviesAlkemy
//
//  Created by Jefferson Naranjo rodríguez on 15/09/22.
//

import Foundation
import UIKit

class MoviesTableViewCell : UITableViewCell{
    
    var name: String? {
        didSet {
            movieName.text = name
        }
    }
    
    private lazy var movieImage: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        aImage.layer.cornerRadius = 30
        aImage.backgroundColor = .lightGray
        aImage.image = UIImage(named: "movieList")
        return aImage
    }()
    
    private lazy var movieName : UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .darkGray
        aLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return aLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .white//Change color
        self.contentView.addSubview(movieImage)
        self.contentView.addSubview(movieName)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            movieImage.heightAnchor
                .constraint(equalToConstant: 60),
            movieImage.widthAnchor
                .constraint(equalToConstant: 60),
            movieImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            movieImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            movieImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            movieName.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 16),
            movieName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            movieName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            movieName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
    }
}
