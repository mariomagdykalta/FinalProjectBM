//
//  AccountConnected.swift
//  FinalProjectBM
//
//  Created by groub G  on 05/08/2024.
//

import UIKit

class AccountConnected: UIViewController {
    @IBOutlet weak var connectBtnTapped: UIButton!
    @IBOutlet weak var backtnTapped: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()

        connectBtnTapped.layer.cornerRadius = 6
        backtnTapped.layer.cornerRadius = 6
        backtnTapped.layer.borderWidth = 1.5
        backtnTapped.layer.borderColor = UIColor(red: 135/255, green: 30/255, blue: 53/255, alpha: 1).cgColor

    }
    
    func setGradientBackground() {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = self.view.bounds

            // Set the gradient colors
            gradientLayer.colors = [
                UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor, // Light pink color
                UIColor(red: 255/255, green: 234/255, blue: 238/255, alpha: 1).cgColor  // Slightly darker pink color
            ]

            // Set the gradient locations
            gradientLayer.locations = [0.0, 1.0]

            // Add the gradient layer to the view's layer
            self.view.layer.insertSublayer(gradientLayer, at: 0)
        }

}
