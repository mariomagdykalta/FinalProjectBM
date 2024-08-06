//
//  LoadingVC.swift
//  FinalProjectBM
//
//  Created by groub G  on 05/08/2024.
import UIKit

class LoadingVC: UIViewController {

    private var loadingScreen: LoadingScreenView?

    @IBOutlet var backGroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Show loading screen
        showLoadingScreen()
        backGroundView.addGradientWithColor()
    }

    func showLoadingScreen() {
        loadingScreen = LoadingScreenView(frame: view.bounds)
        if let loadingScreen = loadingScreen {
            view.addSubview(loadingScreen)
        }

        // Hide loading screen after 5 seconds and transition to OTP view controller
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.hideLoadingScreen()
            self.transitionToOTPViewController()
        }
    }

    func hideLoadingScreen() {
        loadingScreen?.removeFromSuperview()
        loadingScreen = nil
    }

    func transitionToOTPViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let otpVC = storyboard.instantiateViewController(withIdentifier: "OTP") as? OTP {
            otpVC.modalPresentationStyle = .fullScreen // Set presentation style to full screen
            self.present(otpVC, animated: true, completion: nil)
        }
    }
}


//         Alternatively, if you want to manually instantiate the OTP view controller:
//        /*
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if let otpVC = storyboard.instantiateViewController(withIdentifier: "OTPViewController") as? OTPViewController {
//            self.present(otpVC, animated: true, completion: nil)
//        }
//
