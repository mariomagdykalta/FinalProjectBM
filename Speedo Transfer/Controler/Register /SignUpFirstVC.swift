//
//  ViewController.swift
//  FinalProjectBM
//
//  Created by groub G  on 05/08/2024.
//

import UIKit

class SignUpFirstVC: UIViewController {

  //  @IBOutlet weak var customLabel: CustomLabel!

    @IBOutlet weak var signUpbtntapped: UIButton!
    @IBOutlet weak var fullNameInputView: CustomInputView!
    @IBOutlet weak var emailInputView: CustomInputView!
    @IBOutlet weak var passwordInputView: CustomInputView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpInputViews()
        setGradientBackground()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    // Proceed with your app initialization or navigation
                }

 //
       signUpbtntapped.layer.cornerRadius = 6
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

    private func setUpInputViews() {

        let profileViewUiModel = InputViewUiModel(titleLabel: "Full Name", placeHolder: "Enter your Full Name", imageName: "user 1")
        fullNameInputView.model = profileViewUiModel

        let emailViewUiModel = InputViewUiModel(titleLabel: "Email", placeHolder: "Enter your email address", imageName: "email 1", inputType: .email)
        emailInputView.model = emailViewUiModel
        let email = emailInputView.getInputText()



        let passwordViewUiModel = InputViewUiModel(titleLabel: "Password", placeHolder: "Enter your password", imageName: "close-eye", inputType: .passward)
        passwordInputView.model = passwordViewUiModel

    }
    

}



//        let profileView = UIImageView(frame: CGRect(x: 50, y: 50, width: 24, height: 24))
//                let profileImage = UIImage(named: "user 1")
//            profileView.image = profileImage
//
//        fullNameTextField.rightView = profileView
//        fullNameTextField.rightViewMode = .always
//
//        let emailView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
//        let emailImage = UIImage(named: "email 1")
//        emailView.image = emailImage
//
//        emailtextField.rightView = emailView
//        emailtextField.rightViewMode = .always
//
//        let passwordView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
//        let passwordImage = UIImage(named: "close-eye")
//        passwordView.image = passwordImage
//
//        passwordTextField.rightView = passwordView
//        passwordTextField.rightViewMode = .always
//
//
//        fullNameTextField.layer.cornerRadius = 6
//        fullNameTextField.layer.borderWidth = 1.5
//        fullNameTextField.layer.borderColor = UIColor.lightGray.cgColor
//
//        emailtextField.layer.cornerRadius = 6
//        emailtextField.layer.borderWidth = 1.5
//        emailtextField.layer.borderColor = UIColor.lightGray.cgColor
//
//        passwordTextField.layer.cornerRadius = 6
//        passwordTextField.layer.borderWidth = 1.5
//        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
//
