//
//  UpcomingMoviesViewController.swift
//  TheMovieDB
//
//  Created by Sainath Gajavada on 09/02/21.
//

import UIKit

class UpcomingMoviesViewController: UIViewController {
    
    //MARK:- Properties
    @IBOutlet weak var upcomingTableView: UITableView!
    var movies = [MoviesResult]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getUpcomingMoviesList()
        upcomingTableView.register(UINib.init(nibName: "MovieListTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieListTableViewCellID")
        // Do any additional setup after loading the view.
    }
    
    //MARK:- API CALL REQUEST
    private func getUpcomingMoviesList() {
        
        let queryItems:[String:String] = ["api_key": kApiKey]
        ActivityIndicator.sharedInstance.showActivityIndicator()
        APIService.shared.GET(endpoint: APIService.Endpoint.upcoming, queryItems: queryItems, headers: [:]) { (result:Result<UpcomingMoviesModel,APIService.APIError>) in
            
            ActivityIndicator.sharedInstance.hideActivityIndicator()
            switch result {
            
            case let .success(response):
                
                guard let movies = response.results else { return }
                self.movies = movies
                self.upcomingTableView.reloadData()
            print("string")
                break
                
            case let .failure(error):
                
                print(error.localizedDescription)
                break
                
            }
        }
    }
    

}

//MARK:- Tableview Delegate and Datsource Methods
extension UpcomingMoviesViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = upcomingTableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCellID", for: indexPath) as! MovieListTableViewCell
        cell.content_View.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        cell.item = movies[indexPath.row]
        cell.content_View.layer.cornerRadius = 16
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MovieDetailsViewControllerID") as! MovieDetailsViewController
        nextViewController.moviesList = self.movies[indexPath.row]
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
    }
}
