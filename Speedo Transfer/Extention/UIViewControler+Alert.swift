//
//  UIViewControler+Alert.swift
//  FinalProjectBM
//
//  Created by mario on 06/08/2024.
//

import Foundation
import UIKit
extension UIViewController{
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title,
                                      message: message, preferredStyle:
                                        UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default,
                                      handler: nil))
        self.present (alert, animated: true, completion: nil)
    }

}

