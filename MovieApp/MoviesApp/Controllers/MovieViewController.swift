//
//  ViewController.swift
//  MoviesApp
//
//  Created by AMBIN03102 on 23/08/22.
//
import UIKit
import Foundation
class MovieViewController: UIViewController {
    @IBOutlet weak var TableView: UITableView!
    private var viewModel = MovieViewModel()
    //  var apiservice = ApiService()
    override func viewDidLoad() {
        super.viewDidLoad()
       TableView.dataSource = self
       TableView.delegate = self
        //   apiservice.getPopularMoviesData{ (result) in
        //        print(result)
//        loadPopularMoviesData()
        
        viewModel.fetchPopularMoviesData {
            self.TableView.reloadData()
        }
    }
 //   override func viewWillAppear(_ animated:Bool){
//        super.viewWillAppear(animated)
//        UINavigationController?setNavigationBarHidden(true, animated: false)
//    }
//    override func viewDidDisappear(_ animated:Bool){
//        super.viewWillAppear(animated)
//        UINavigationController?setNavigationBarHidden(false, animated: true)
//    }
}
extension MovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        let movie = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(movie)
        return cell
    }
}
extension MovieViewController: UITableViewDelegate {
    func tableView(_ tableView:UITableView, didDeselectRowAt indexPath: IndexPath) {
        let detailView : DetailViewController =  self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let movie = viewModel.cellForRowAt(indexPath: indexPath)
            detailView.movieData = movie
            self.navigationController?.pushViewController(detailView, animated: true)
     }
}




