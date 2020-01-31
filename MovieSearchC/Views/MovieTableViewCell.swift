//
//  MovieTableViewCell.swift
//  MovieSearchC
//
//  Created by Maxwell Poffenbarger on 1/31/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieSummaryLabel: UILabel!
    
    //MARK: - Private Methods
    func updateViews(with movie: MOPMovieInfo) {
        movieTitleLabel.text = movie.title
        movieRatingLabel.text = "\(movie.rating)"
        movieSummaryLabel.text = movie.summary
    }
}//End of class
