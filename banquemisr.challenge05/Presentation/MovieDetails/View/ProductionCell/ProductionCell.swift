//
//  ProductionCell.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 03/02/2025.
//

import UIKit

class ProductionCell: UITableViewCell {
    
    @IBOutlet private weak var uiLogo: UIImageView!
    @IBOutlet private weak var uiName: UILabel!
    @IBOutlet private weak var uiOriginCountry: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func configureCell(with data: ProductionCompanyModel?) {
        let strURL = ImageConstants.imageURL(for: data?.logoPath ?? "")
        self.uiLogo.load(urlString: strURL)
        self.uiName.text = data?.name
        self.uiOriginCountry.text = "Origin : \(data?.originCountry ?? "")"
    }
    
    
}
