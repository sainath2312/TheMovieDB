//
//  MovieDetailsViewController.swift
//  TheMovieDB
//
//  Created by Sainath Gajavada on 10/02/21.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var movieDetailsView: UIView!
    @IBOutlet weak var movieImgView: UIImageView!
    @IBOutlet weak var movieTitleLbl: UILabel!
    @IBOutlet weak var moviePosterImgView: UIImageView!
    @IBOutlet weak var movieOverviewTextView: UITextView!
    @IBOutlet weak var moviePopularityLabel: UILabel!
    @IBOutlet weak var movieLanguageLbl: UILabel!
    
    var moviesList:MoviesResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadMovieDetails()
        self.movieDetailsView.layerGradient(colors: [UIColor(.liteDark).cgColor, UIColor(.blackDark).cgColor])
        movieImgView.layer.cornerRadius = movieImgView.bounds.width / 2
        self.moviePosterImgView.layer.cornerRadius = 6
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Fetching Movie Details
    private func loadMovieDetails() {
        
        guard let movieList = moviesList else { return }
        self.movieTitleLbl.text = movieList.title
        self.moviePopularityLabel.text = "Popularity: \(movieList.popularity ?? 0)"
        self.movieOverviewTextView.text = movieList.overview
        self.movieLanguageLbl.text = "MovieLanguage :\(movieList.original_language ?? "")"
        GLOBALS.imageLoad(imgView: self.moviePosterImgView, url: "\(imageBaseURL)\(movieList.backdrop_path ?? "")")
        
        GLOBALS.imageLoad(imgView: self.movieImgView, url: "\(imageBaseURL)\(movieList.poster_path ?? "")")
    }
    

    @IBAction func onBackButtonClick(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
}
