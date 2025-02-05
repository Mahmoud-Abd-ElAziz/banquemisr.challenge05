//
//  MovieDetailsViewController.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 02/02/2025.
//

import UIKit

class MovieDetailsViewController: BaseViewController<MovieDetailsViewModel> {
    
    @IBOutlet private weak var uiTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
    }

    override func bindSubscribers(viewModel: MovieDetailsViewModel?) {
        super.bindSubscribers(viewModel: viewModel)
        
        guard let viewModel else { return }
        
        self.setupTableView()
        self.subsribeOnMovieLoaded(with: viewModel)
        viewModel.fetchMovieDetails()
        
    }
    
    override func setStyle() {
        super.setStyle()
        
        self.view.accessibilityIdentifier = "MovieDetailView"
    
    }
    
    

}
//MARK: - Binding
extension MovieDetailsViewController {
    
    private func subsribeOnMovieLoaded(with viewModel: MovieDetailsViewModel) {
        viewModel.movieDetailsPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] movie in
                guard let strongSelf = self else { return }
                strongSelf.uiTableView.reloadData()
            }
            .store(in: &viewModel.cancellables)
    }
}
//MARK: - Configure tableview
extension MovieDetailsViewController:UITableViewDelegate , UITableViewDataSource {
     
    private func setupTableView() {
        uiTableView.registerNib(cell: PosterCell.self)
        uiTableView.registerNib(cell: TextCell.self)
        uiTableView.registerNib(cell: ProductionCell.self)
        
        uiTableView.delegate = self
        uiTableView.dataSource = self
        
        uiTableView.separatorStyle = .none
        uiTableView.rowHeight = UITableView.automaticDimension
        uiTableView.estimatedRowHeight = 200
        
        uiTableView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.sections.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.sections[safe: section]?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel?.sections[safe:section]?.type.title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sections = viewModel?.sections
        let section = sections?[safe:indexPath.section]
        guard indexPath.row < section?.items.count ?? 0 else {
            Logger.logging(" ❌❌❌ Row index out of range")
            return UITableViewCell()
        }
        switch section?.type {
        case .poster:
            let cell = self.uiTableView.dequeue() as PosterCell
            if let posterUrl = section?.items[safe: indexPath.row] as? String {
                cell.configureCell(with: posterUrl)
                cell.setNeedsLayout()
                cell.layoutIfNeeded()
                self.uiTableView.beginUpdates()
                self.uiTableView.endUpdates()
            }
            return cell
        case .details:
            let cell = self.uiTableView.dequeue() as TextCell
            if let text = section?.items[safe: indexPath.row] as? String {
                cell.configureCell(with: text)
            }
            return cell
            
        case .productionCompanies:
            let cell = self.uiTableView.dequeue() as ProductionCell
            if let company = section?.items[safe: indexPath.row] as? ProductionCompanyModel {
                cell.configureCell(with: company)
            }
            return cell
        default : break
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
