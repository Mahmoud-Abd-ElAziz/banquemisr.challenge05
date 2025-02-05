//
//  PosterCell.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 03/02/2025.
//

import UIKit

class PosterCell: UITableViewCell {
    
    @IBOutlet private weak var uiMovieImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
       
        
    }

    
    func configureCell(with path: String?) {
        let strURL = ImageConstants.imageURL(for: path ?? "")
        self.uiMovieImg.load(urlString: strURL)

    }
    
}
