//
//  ModelList.swift
//  MoviesApp
//
//  Created by AMBIN03079 on 23/08/22.
//
import UIKit
import Foundation
struct MoviesData: Decodable {
    let movies: [Movie]
    private enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}
struct Movie: Decodable {
    let title: String?
    let year: String?
    let rate: Double?
    let posterImage: String?
    let overview: String?
    let orglan:String?
    //let adult:String?
    private enum CodingKeys: String, CodingKey {
        case title, overview
        case year = "release_date"
        case rate = "vote_average"
       // case vc = "adult"
        case orglan = "orginal_language"
        case posterImage = "poster_path"
    }
}
