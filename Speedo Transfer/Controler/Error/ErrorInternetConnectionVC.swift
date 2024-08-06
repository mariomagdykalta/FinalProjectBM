//
//  ErrorInternetConnectionVC.swift
//  FinalProjectBM
//
//  Created by groub G  on 05/08/2024.
//

import UIKit

class ErrorInternetConnectionVC: UIViewController {
    @IBOutlet weak var updateBtnTapped: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setGradientBackground()
        
        updateBtnTapped.layer.cornerRadius = 6
    }
    
    func setGradientBackground() {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = self.view.bounds

            // Set the gradient colors
            gradientLayer.colors = [
                UIColor(red: 255/255, green: 248/255, blue: 231/255, alpha: 1).cgColor, // Light pink color
                UIColor(red: 255/255, green: 234/255, blue: 238/255, alpha: 1).cgColor  // Slightly darker pink color
            ]

            // Set the gradient locations
            gradientLayer.locations = [0.0, 1.0]

            // Add the gradient layer to the view's layer
            self.view.layer.insertSublayer(gradientLayer, at: 0)
        }
}
