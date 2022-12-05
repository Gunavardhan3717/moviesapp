//
//  posterViewModel.swift
//  MoviesApp
//
//  Created by AMBIN03102 on 25/08/22.
//

import Foundation
import UIKit
class posterViewModel {
    func getImageData(url : URL, completion: @escaping(Data) -> ()) {
//let urlString = "https://image.tmdb.org/t/p/w300" + posterString
//guard let posterImageURL = URL(string: urlString) else {
//    self.moviePoster.image = UIImage(named: "noImageAvailable")
//    return
//}
//self.moviePoster.image = nil
//getImageDataFrom(url: posterImageURL)
//}
let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
         if let error = error {
        print("DataTask error: \(error.localizedDescription)")
//        return
    }
    guard let data = data else {
        print("Empty Data")
        return
    }
    DispatchQueue.main.async {
//        if let image = UIImage(data: data) {
//            self.moviePoster.image = image
        completion(data)
      //  return
        }
    }
        dataTask.resume()
}
}

