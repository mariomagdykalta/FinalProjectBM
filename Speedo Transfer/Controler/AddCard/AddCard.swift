//
//  AddCard.swift
//  FinalProjectBM
//
//  Created by groub G  on 05/08/2024.
//

import UIKit

class AddCard: UIViewController {
    @IBOutlet weak var cardHolderName: CustomInputView!
    @IBOutlet weak var cardNo: CustomInputView!
    @IBOutlet weak var mmyyLabel: UILabel!
    @IBOutlet weak var cvvLabel: UILabel!
    @IBOutlet weak var mmyyTextField: UITextField!
    @IBOutlet weak var cvvtextField: UITextField!
    @IBOutlet weak var signOnBtnTapped: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        setUpInputViews()
        
        mmyyTextField.layer.cornerRadius = 6
        mmyyTextField.layer.borderWidth = 1.5
        mmyyTextField.layer.borderColor = UIColor.lightGray.cgColor
       
        cvvtextField.layer.cornerRadius = 6
        cvvtextField.layer.borderWidth = 1.5
        cvvtextField.layer.borderColor = UIColor.lightGray.cgColor
        
        signOnBtnTapped.layer.cornerRadius = 6
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
        
        let cardNameUiModel = InputViewUiModel(titleLabel: "Cardholder Name", placeHolder: "Enter your Cardholder Name")
        cardHolderName.model = cardNameUiModel
        
        let cardNoUiModel = InputViewUiModel(titleLabel: "Card NO", placeHolder: "Card NO")
        cardNo.model = cardNoUiModel
        let cardNo = cardNo.getInputText()
        
        }
}
