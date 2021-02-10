//
//  UpComingModel.swift
//  TheMovieDB
//
//  Created by Sainath Gajavada on 09/02/21.
//

import Foundation

// MARK : - Upcoming Movies Model

struct UpcomingMoviesModel : Codable {
    
    let dates : Date?
    let page : Int?
    let results : [MoviesResult]?
    let total_pages : Int?
    let total_results : Int?
    
}

struct Date : Codable {
    
    let maximum : String?
    let minimum : String?
    
}
