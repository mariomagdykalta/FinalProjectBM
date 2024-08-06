//
//  ChangedPasswordVC.swift
//  FinalProjectBM
//
//  Created by groub G  on 05/08/2024.
//

import UIKit

class ChangedPasswordVC: UIViewController {
    @IBOutlet weak var saveBtnTapped: UIButton!
    @IBOutlet weak var currentPassInputView: CustomInputView!
    @IBOutlet weak var newPassInputView: CustomInputView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveBtnTapped.layer.cornerRadius = 6
        setGradientBackground()
        setUpInputViews()
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
    
    private func setUpInputViews() {
        
        let currentPass = InputViewUiModel(titleLabel: "Current Password", placeHolder: "Enter your password", imageName: "close-eye")
        currentPassInputView.model = currentPass
        
        let newPass = InputViewUiModel(titleLabel: "New Password", placeHolder: "Enter your password", imageName: "close-eye")
        newPassInputView.model = newPass
    
    }

    @IBAction func saveBtnTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func backToSettingBtnTapped(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let settingVC = sb.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
        self.present(settingVC, animated: true)
    }
    
}
