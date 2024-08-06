//
//  EditProfileVC.swift
//  FinalProjectBM
//
//  Created by groub G  on 05/08/2024.
//

import UIKit

class EditProfileVC: UIViewController {
    @IBOutlet weak var fullNameInputView: CustomInputView!
    @IBOutlet weak var emailInputView: CustomInputView!
    @IBOutlet weak var countryInputView: CustomInputView!
    @IBOutlet weak var dateOfBirthInputView: CustomInputView!
    @IBOutlet weak var saveBtnTapped: UIButton!
    
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
        
        let fullNameViewUiModel = InputViewUiModel(titleLabel: "Full Name", placeHolder: "Enter Cardholder Name")
        fullNameInputView.model = fullNameViewUiModel
        
        let emailViewUiModel = InputViewUiModel(titleLabel: "Email", placeHolder: "Enter Cardholder Email", imageName: "email 1", inputType: .email)
        emailInputView.model = emailViewUiModel
        let email = emailInputView.getInputText()
        
        
        
        let countryViewUiModel = InputViewUiModel(titleLabel: "Country", placeHolder: "Enter your Country")
        countryInputView.model = countryViewUiModel
        
        let dateOfBirthViewUiModel = InputViewUiModel(titleLabel: "Date Of Birth", placeHolder: "Enter your Date Of Birth")
        dateOfBirthInputView.model = dateOfBirthViewUiModel
        
    }
    
    @IBAction func saveBtntapped(_ sender: UIButton) {
        let fullName = fullNameInputView.getInputText()
        let email = emailInputView.getInputText()
        let country = countryInputView.getInputText()
        let dateOfBirth = dateOfBirthInputView.getInputText()
    }
    
    @IBAction func backToSettingBtnTapped(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let settingVC = sb.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
        self.present(settingVC, animated: true)
    }
}
