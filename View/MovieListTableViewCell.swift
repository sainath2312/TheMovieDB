//
//  MovieListTableViewCell.swift
//  TheMovieDB
//
//  Created by Sainath Gajavada on 09/02/21.
//

import UIKit

class MovieListTableViewCell: CustomTableViewCell {
    
    // MARK : - Properties
    @IBOutlet weak var content_View: UIView!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var movieReleaseDateLabel: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK:- Configuring TableView Cell
    override func configure(_ item: Any?) {
        
        guard let movie = item as? MoviesResult else { return }
        self.movieTitleLabel.text = movie.title
        //self.movieOverView.text = "Popularity: \(movie.popularity ?? 0)"
        self.movieReleaseDateLabel.text = "Release Date: \(movie.release_date ?? "")"
        self.ratingLabel.text = String(movie.vote_average!)
        GLOBALS.imageLoad(imgView: self.moviePosterImageView, url: "\(imageBaseURL)\(movie.poster_path ?? "")")
    }
    
    
}
