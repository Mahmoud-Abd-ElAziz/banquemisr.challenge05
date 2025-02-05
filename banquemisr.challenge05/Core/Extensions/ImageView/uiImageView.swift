//
//  uiImageView.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//

import UIKit

var imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func load(urlString: String, placeholder: UIImage? = nil) {
        self.image = placeholder

        guard let url = URL(string: urlString) else { return }
        if let image = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = image
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else  { return }
                        imageCache.setObject(image, forKey: urlString as NSString)
                        self.image = image
                    }
                }
            }
        }
    }
}
