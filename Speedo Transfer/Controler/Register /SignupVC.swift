//
//  SignupVC.swift
//  FinalProjectBM//
//  Created by groub G  on 05/08/2024.
////
//
//import UIKit
//
//class SignupVC: UIViewController {
//
//
//    @IBOutlet weak var signNameTxtField: CustomTextField!
//
//
//    @IBOutlet weak var signEmailTxtField: CustomTextField!
//
//    @IBOutlet weak var signPasswordTxtField: CustomTextField!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        TxtFields()
//        setupNavBar()
//
//    }
//
//
//
//    @IBAction func signUpBtnTapped(_ sender: Any) {
//        let SignUp2 = self.storyboard?.instantiateViewController(withIdentifier: "secondSignupVC") as! secondSignupVC
//        self.navigationController?.pushViewController(SignUp2, animated: true)
//    }
//
//
//    @IBAction func signInBtnTapped(_ sender: Any) {
//        let SignIn = self.storyboard?.instantiateViewController(withIdentifier: "SignInVC") as! signInVC
//        self.navigationController?.pushViewController(SignIn, animated: true)
//    }
//
//
//
//    private func setupNavBar(){
//        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "DRop down 1")
//        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "DRop down 1")
//        navigationItem.leftItemsSupplementBackButton = false
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
//        title = "Sign Up"
//    }
//
//    private func TxtFields() {
//        signNameTxtField.setType(.name)
//        signNameTxtField.placeholder = "Enter your name"
//
//        signEmailTxtField.setType(.email)
//        signEmailTxtField.placeholder = "Enter your Email"
//
//        signPasswordTxtField.setType(.password)
//        signPasswordTxtField.placeholder = "Enter your Password"
//    }
//}
