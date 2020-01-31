//
//  MovieTableViewController.swift
//  MovieSearchC
//
//  Created by Maxwell Poffenbarger on 1/31/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    //MARK: - Properties
    var movies: [MOPMovieInfo] = []
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        movieSearchBar.delegate = self
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else {return UITableViewCell()}
        
        let movie = movies[indexPath.row]
        
        cell.updateViews(with: movie)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 7
    }
}

//MARK: - Extensions
extension MovieTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else {return}
        
        MOPMovieController.fetchMovies(searchTerm) { (movies) in
            DispatchQueue.main.async {
                self.movies = movies
                searchBar.text = ""
                self.tableView.reloadData()
            }
        }
    }
}//End of extension
