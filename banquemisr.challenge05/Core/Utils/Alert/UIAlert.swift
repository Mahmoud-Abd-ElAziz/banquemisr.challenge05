//
//  UIAlert.swift
//  Storex
//
//  Created by Mahmoud Abd ElAziz on 21/07/2024.
//

import UIKit

class Alert{
    static func customAlert(_ alertTitle: String, alertMessage: String,VC : AnyObject?,actionBtnTitle:String,isCancelEnable:Bool, completion: @escaping()->()){
        guard let viewController = VC as? UIViewController else {
             Logger.logging("Failed to present alert: VC is not a UIViewController.")
             return
         }
        let alertController = UIAlertController(title: alertTitle, message:alertMessage, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: actionBtnTitle, style: .default) { (action) in
            completion()
        }
        let cancelAction = UIAlertAction(title: "Dismiss", style: .cancel) { (action) in
        }
        alertController.addAction(OKAction)
        if isCancelEnable == true {
            alertController.addAction(cancelAction)
        }
        viewController.present(alertController, animated: true, completion: nil)
    }
    
}
