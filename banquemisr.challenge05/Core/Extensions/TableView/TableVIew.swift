//
//  TableVIew.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 03/02/2025.
//

import UIKit

extension UITableView {
    
    func reload() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
    func registerNib<Cell:UITableViewCell>(cell:Cell.Type) {
        let nibName = String(describing: Cell.self)
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
    
    func dequeue<Cell:UITableViewCell>() -> Cell {
        let identifier = String(describing: Cell.self)
        guard let cell =  self.dequeueReusableCell(withIdentifier: identifier) as? Cell else { fatalError(" Error in cell") }
           return cell
    }
    
    
}
