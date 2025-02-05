//
//  BaseViewController.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//

import UIKit

class BaseViewController<T: BaseViewModel> :UIViewController {
    
    var viewModel:T?

    init(viewModel: T) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.bindSubscribers(viewModel: viewModel)
        self.setStyle()

        
    }
    
    
    func bindSubscribers(viewModel:T?){
        guard let viewModel = viewModel else {return}
        viewModel.bindErrorHandling(to: self)
    }
    
    func setStyle() {}
    
    
}
