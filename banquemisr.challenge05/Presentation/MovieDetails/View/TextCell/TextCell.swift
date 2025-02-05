//
//  TextCell.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 04/02/2025.
//

import UIKit

class TextCell: UITableViewCell {
    
    @IBOutlet private weak var uiLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        uiLabel.numberOfLines = 0
        uiLabel.lineBreakMode = .byWordWrapping
        
    }

    
    func configureCell(with text: String) {
        uiLabel.text = text
    }
    
}
