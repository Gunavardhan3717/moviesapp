//
//  DetailViewController.swift
//  MoviesApp
//
//  Created by AMBIN03079 on 25/08/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var overview: UITextView!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var Votecount: UILabel!
    private var viewModel = MovieViewModel()
    private var posterVM = posterViewModel()
    var movieData : Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
      let urlString = "https://image.tmdb.org/t/p/w300\(movieData?.posterImage ?? "")"
        self.overview.text = "Overview : \(movieData?.overview ?? "")"
        self.language.text = "Language : \(movieData?.orglan ?? "English")"
        
       // self.Votecount.text = "Vote count : \(movieData?.vc ?? 0.0 )"
        self.rating.text = "Rating : \(movieData?.rate ?? 0.0 )"
        self.releaseDate.text = "Release Date : \(movieData?.year ?? "") "
        self.movieTitle.text = "Title : \(movieData?.title ?? "") "
        posterVM.getImageData(url: URL(string: urlString)!) {
            data in
            if let image = UIImage(data: data) {
                self.moviePoster.image = image
        }
//        if let movieList = self.movieData {
//            self.moviePoster.image = "MoviePoster : \(movieList.posterImage)"
//        }
        }
}
}
