//
//  GradientView.swift
//  FinalProjectBM
//
//  Created by Abdelrahman Amer on 31/07/2024.
//
import UIKit

extension UIView {
    func addGradientWithColor() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds

        gradientLayer.colors = [
            UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor,
            UIColor(red: 255/255, green: 234/255, blue: 238/255, alpha: 1).cgColor
        ]

        // Set the gradient locations
        gradientLayer.locations = [0.0, 1.0]

        // Add the gradient layer to the view's layer
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    // Ensure gradient layer covers the entire view on layout changes
    func updateGradientFrame() {
        if let gradientLayer = self.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = self.bounds
        }
    }
}
