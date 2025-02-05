//
//  MovieCell.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 03/02/2025.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet private weak var uiMovieImg: UIImageView!
    @IBOutlet private weak var uiMovieTitle: UILabel!
    @IBOutlet private weak var uiMovieReleaseDate: UILabel!
    @IBOutlet private weak var uiMovieRating: UILabel!
    @IBOutlet private weak var uiMovieOverview: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  
    func configureCell(with info:MovieDataModel?){
        let strURL = ImageConstants.imageURL(for: info?.posterPath ?? "")
        self.uiMovieImg.load(urlString: strURL)
        self.uiMovieTitle.text = info?.title
        self.uiMovieReleaseDate.text = info?.releaseDate
        self.uiMovieRating.text = " ⭐️ \(info?.voteAverage ?? 0.0)"
        self.uiMovieOverview.text = info?.overview
    }
    
}
