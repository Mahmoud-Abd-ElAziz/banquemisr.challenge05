//
//  ViewController.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//

import UIKit

extension UIViewController {
    
    func HandleError(error: HttpClientError, handler: (()->())? = nil) {
        switch error {
        case .customString(let msg):
            Toast.show(message: msg, controller: self)
        default:
            Alert.customAlert(error.errorDescription?.replacingOccurrences(of: "*", with: "") ?? "",
                              alertMessage: "",
                              VC: self, actionBtnTitle: "Ok", isCancelEnable: false) {
                handler?()
            }            
        }
    }
}
