//
//  UIAlert.swift
//  Storex
//
//  Created by Mahmoud Abd ElAziz on 21/07/2024.
//

import UIKit

class ActivityIndicatorManager {
    
    static let shared = ActivityIndicatorManager()
    
    private var overlayView: UIView?
    private var activityIndicator: UIActivityIndicatorView?

    private init() {}

    func showLoader(on view: UIView) {
        DispatchQueue.main.async {
            if self.overlayView == nil {
                let overlay = UIView(frame: view.bounds)
                overlay.backgroundColor = UIColor.black.withAlphaComponent(0.4)

                let indicator = UIActivityIndicatorView(style: .large)
                indicator.center = overlay.center
                indicator.startAnimating()

                overlay.addSubview(indicator)
                view.addSubview(overlay)

                self.overlayView = overlay
                self.activityIndicator = indicator
            }
        }
    }

    func hideLoader() {
        DispatchQueue.main.async {
            self.activityIndicator?.stopAnimating()
            self.overlayView?.removeFromSuperview()
            self.overlayView = nil
            self.activityIndicator = nil
        }
    }
}
