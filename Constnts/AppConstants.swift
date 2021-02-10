//
//  AppConstants.swift
//  TheMovieDB
//
//  Created by Sainath Gajavada on 09/02/21.
//

import Foundation
import UIKit

let BASEURL = "https://api.themoviedb.org/3/movie/"
let kApiKey = "1cfbf7afa59b96e0791a368a47f853cb"
let imageBaseURL = "https://image.tmdb.org/t/p/original/"
let GLOBALS = Global.sharedInstance
let APP = UIApplication.shared.delegate as! AppDelegate


enum ServiceType {
    case topRated
    case upcoming
    
    func url() -> String {
        
        switch self {
        case .topRated:
            return BASEURL + "top_rated"
        case .upcoming:
            return BASEURL + "upcoming"
        }
    }
}
