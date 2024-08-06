//
//  ImageExtention.swift
//  FinalProjectBM
//
//  Created by SONOMA on 01/08/2024.
//

import UIKit


extension UITextField {
    func imageSetup(imageNamed: String){
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        imageView.image = UIImage (named: imageNamed)
        let imageContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
        imageContainerView.addSubview(imageView)
        rightView = imageContainerView
        rightViewMode = .always
        self.tintColor = .lightGray
    }
}
