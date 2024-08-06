//
//  ErrorServerVC.swift
//  FinalProjectBM
//
//  Created by groub G  on 05/08/2024.
//

import UIKit

class ErrorServerVC: UIViewController {
    @IBOutlet weak var callUsBtnTapped: UIButton!
    @IBOutlet weak var messageusBtnTapped: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setGradientBackground()
        
        callUsBtnTapped.layer.cornerRadius = 6
        messageusBtnTapped.layer.cornerRadius = 6
        messageusBtnTapped.layer.borderWidth = 1.5
        messageusBtnTapped.layer.borderColor = UIColor(red: 135/255, green: 30/255, blue: 53/255, alpha: 1).cgColor
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
