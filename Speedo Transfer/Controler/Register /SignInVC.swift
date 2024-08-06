//
//  signInVC.swift
//
//  Created by  groub G on 31/07/2024.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var signInEmailTxtField: CustomTextField!
    @IBOutlet weak var signInPasswordTxtField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
        self.navigationItem.hidesBackButton = true
        title = "Sign In"
    }
    
    private func setupTextFields() {
        signInEmailTxtField?.setType(.email)
        signInEmailTxtField?.placeholder = "Enter your Email"
        
        signInPasswordTxtField?.setType(.password)
        signInPasswordTxtField?.placeholder = "Enter your Password"
    }
    
    @IBAction func signUpBtnTapped(_ sender: Any) {
        guard let storyboard = self.storyboard else {
            print("Storyboard not found")
            return
        }
        
        guard let signUpVC = storyboard.instantiateViewController(withIdentifier: "SignUpSecondVC") as? SignUpSecondVC else {
            print("Could not instantiate SignUpSecondVC")
            return
        }
        
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
}
