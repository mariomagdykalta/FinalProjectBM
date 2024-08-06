//
//  ProfileVC.swift
//  FinalProjectBM
//
//  Created by groub G  on 05/08/2024.
//

import UIKit

class ProfileVC: UIViewController {
    @IBOutlet weak var personalInfoView: UIView!
    @IBOutlet weak var settingView: UIView!
    @IBOutlet weak var paymentHistoryView: UIView!
    @IBOutlet weak var myFsvouriteListView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setGradientBackground()
        
        addBorders(to: personalInfoView)
        addBorders(to: settingView)
        addBorders(to: paymentHistoryView)
        addBorders(to: myFsvouriteListView)
    
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

    
    @IBAction func personalInfoBtnTapped(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let profileInformationVC = sb.instantiateViewController(withIdentifier: "ProfileInformationVC") as! ProfileInformationVC
        self.present(profileInformationVC, animated: true)
    }
    
    @IBAction func settingBtnTapped(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let SettingVC = sb.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
        self.present(SettingVC, animated: true)
    }
    
    
    func addBorders(to view: UIView) {
            // Top border
            let topBorder = UIView()
            topBorder.backgroundColor = .clear
            view.addSubview(topBorder)
            
            topBorder.translatesAutoresizingMaskIntoConstraints = false
            topBorder.heightAnchor.constraint(equalToConstant: 0).isActive = true
            topBorder.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            topBorder.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            topBorder.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            
            // Left border
            let leftBorder = UIView()
            leftBorder.backgroundColor = .clear
            view.addSubview(leftBorder)
            
            leftBorder.translatesAutoresizingMaskIntoConstraints = false
            leftBorder.widthAnchor.constraint(equalToConstant: 0).isActive = true
            leftBorder.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            leftBorder.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            leftBorder.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            
            // Bottom border
            let bottomBorder = UIView()
            bottomBorder.backgroundColor = .lightGray
            view.addSubview(bottomBorder)
            
            bottomBorder.translatesAutoresizingMaskIntoConstraints = false
            bottomBorder.heightAnchor.constraint(equalToConstant: 1).isActive = true
            bottomBorder.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            bottomBorder.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            bottomBorder.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            
            // Right border
            let rightBorder = UIView()
            rightBorder.backgroundColor = .clear
            view.addSubview(rightBorder)
            
            rightBorder.translatesAutoresizingMaskIntoConstraints = false
            rightBorder.widthAnchor.constraint(equalToConstant: 0).isActive = true
            rightBorder.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            rightBorder.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            rightBorder.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        }
}
