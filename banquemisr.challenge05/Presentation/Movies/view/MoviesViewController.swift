//
//  MoviesViewController.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 02/02/2025.
//

import UIKit

class MoviesViewController: BaseViewController<MoviesViewModel> {
    
    @IBOutlet private weak var uiTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    override func bindSubscribers(viewModel: MoviesViewModel?) {
        super.bindSubscribers(viewModel: viewModel)
        
        guard let viewModel else { return }
        
        self.setupTableView()
        self.subsribeOnMoviesLoaded(with: viewModel)
        viewModel.fetchMovies()
        
    }

    override func setStyle() {
        super.setStyle()
        
        self.navigationItem.title =  viewModel?.moviesCategoeyType.navigationTitle
    }
    
    

}
//MARK: - Binding
extension MoviesViewController {
    
    private func subsribeOnMoviesLoaded(with viewModel: MoviesViewModel) {
        viewModel.moviesPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] movies in
                guard let strongSelf = self else { return }
                Logger.logging("Movies count: \(movies.count)")
                strongSelf.uiTableView.reloadData()
            }
            .store(in: &viewModel.cancellables)
    }
    
    
    
}
//MARK: - Bind TableView
extension MoviesViewController:UITableViewDataSource , UITableViewDelegate {
    
    private func setupTableView() {
        uiTableView.accessibilityIdentifier = "MoviesTableView"
        uiTableView.registerNib(cell: MovieCell.self)
        uiTableView.dataSource = self
        uiTableView.delegate = self
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Logger.logging("count == \(viewModel?.movies?.count ?? 0)")
        return viewModel?.getMovies().count ?? 0
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeue() as MovieCell
          let movie = viewModel?.getMovies()[safe: indexPath.row]
              cell.configureCell(with: movie)
          return cell
      }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let movies = viewModel?.getMovies(),
              !viewModel!.isFetching,
              viewModel!.hasMorePages,
              indexPath.row == movies.count - 1
        else { return }
        viewModel?.loadMoreMovies()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let movieID = viewModel?.getMovies()[safe: indexPath.row]?.id {
            self.routeToDetail(with: movieID)
        }
    }
    
    private func routeToDetail(with movieID: Int) {
        let view = MovieDetailsModuleConfiguration.configureView(with: movieID)
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    
}
