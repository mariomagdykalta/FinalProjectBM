//
//  LoadingConecting.swift
//  FinalProjectBM
//
//  Created by groub G  on 05/08/2024.
//

import UIKit

class LoadingScreenView: UIView {
    
    private let circleLayer = CAShapeLayer()
    private let progressLayer = CAShapeLayer()
    private let speedoLabel = UILabel()
    private let transferLabel = UILabel()
    private let outerLabel = UILabel()
    
    var progress: CGFloat = 0 {
        didSet {
            updateProgress()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        // Set the background color of the entire view
        self.backgroundColor = UIColor.systemBackground
        
        // Create the circular path
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: self.bounds.midX, y: self.bounds.midY), radius: 87, startAngle: -CGFloat.pi / 2, endAngle: CGFloat.pi * 1.5, clockwise: true)
        
        // Configure the circle layer (which is essentially the background circle)
        circleLayer.path = circlePath.cgPath
        circleLayer.strokeColor = UIColor.lightGray.cgColor
        circleLayer.lineWidth = 5
        circleLayer.fillColor = UIColor.systemBackground.cgColor // Fill the circle with system background color
        circleLayer.lineCap = .round
        
        // Configure the progress layer
        progressLayer.path = circlePath.cgPath
        progressLayer.strokeColor = UIColor(red: 0.6, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
        progressLayer.lineWidth = 5
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.strokeEnd = 0
        
        self.layer.addSublayer(circleLayer)
        self.layer.addSublayer(progressLayer)
        
        // Configure the "Speedo" label (inside the circle)
        speedoLabel.text = "Speedo"
        speedoLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        speedoLabel.textColor = .black
        speedoLabel.textAlignment = .center
        speedoLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(speedoLabel)
        
        // Configure the "Transfer" label (inside the circle, below "Speedo")
        transferLabel.text = "Transfer"
        transferLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        transferLabel.textColor = .black
        transferLabel.textAlignment = .center
        transferLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(transferLabel)
        
        // Configure the outer label (below the circle)
        outerLabel.text = "Connecting to Speedo Transfer Credit card"
        outerLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        outerLabel.textColor = .black
        outerLabel.textAlignment = .center
        outerLabel.numberOfLines = 0
        outerLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(outerLabel)
        
        // Add constraints to the labels
        NSLayoutConstraint.activate([
            // Speedo label constraints
            speedoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            speedoLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10),
            
            // Transfer label constraints
            transferLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            transferLabel.topAnchor.constraint(equalTo: speedoLabel.bottomAnchor, constant: 4),
            
            // Outer label constraints
            outerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            outerLabel.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 120),
            outerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            outerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
        startAnimation()
    }

    
    private func startAnimation() {
        // Create the stroke animation
        let strokeAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeAnimation.fromValue = 0
        strokeAnimation.toValue = 1
        strokeAnimation.duration = 1.5
        strokeAnimation.repeatCount = .infinity
        
        // Add the animation to the progress layer
        progressLayer.add(strokeAnimation, forKey: "loadingAnimation")
    }
    
    private func updateProgress() {
        progressLayer.strokeEnd = progress
    }
}

