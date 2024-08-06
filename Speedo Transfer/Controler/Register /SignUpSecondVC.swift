//
//  SignUpVC.swift
//  FinalProjectBM
//
//  Created by groub G  on 05/08/2024.
//
import UIKit
import FittedSheets

class SignUpSecondVC: UIViewController {
    
    @IBOutlet var backGroundView: UIView!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backGroundView.addGradientWithColor()
        
        countryTextField.layer.cornerRadius = 6
        countryTextField.layer.borderWidth = 1.5
        countryTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        dateTextField.layer.cornerRadius = 6
        dateTextField.layer.borderWidth = 1.5
        dateTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        let selectCountryButton = UIButton(type: .custom)
        selectCountryButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        selectCountryButton.tintColor = .gray
        selectCountryButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        selectCountryButton.addTarget(self, action: #selector(countryViewTapped), for: .touchUpInside)
        
        let countryButtonWrapper = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
        selectCountryButton.frame.origin.x = 10
        countryButtonWrapper.addSubview(selectCountryButton)
        countryTextField.rightView = countryButtonWrapper
        countryTextField.rightViewMode = .always
        
        let selectDateButton = UIButton(type: .custom)
        selectDateButton.setImage(UIImage(named: "date1"), for: .normal)
        selectDateButton.tintColor = .gray
        selectDateButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        selectDateButton.addTarget(self, action: #selector(dateViewTapped), for: .touchUpInside)
        
        let dateButtonWrapper = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
        selectDateButton.frame.origin.x = 10 
        dateButtonWrapper.addSubview(selectDateButton)
        dateTextField.rightView = dateButtonWrapper
        dateTextField.rightViewMode = .always
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backGroundView.updateGradientFrame()
    }
    
    @objc func countryViewTapped() {
        let countryStoryboard = UIStoryboard(name: "CountrySelect", bundle: nil)
        guard let contentCountryVC = countryStoryboard.instantiateViewController(withIdentifier: "CountrySelectVC") as? CountrySelectVC else {
            return
        }
        let sheetController = SheetViewController(controller: contentCountryVC, sizes: [.fixed(500), .intrinsic])
        self.present(sheetController, animated: true, completion: nil)
    }
    
    @objc func dateViewTapped() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline

        let alertController = UIAlertController(title: "Select Date", message: nil, preferredStyle: .actionSheet)
        
        alertController.view.addSubview(datePicker)
        
        // Add constraints to the date picker
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: alertController.view.topAnchor, constant: 20),
            datePicker.leadingAnchor.constraint(equalTo: alertController.view.leadingAnchor, constant: 10),
            datePicker.trailingAnchor.constraint(equalTo: alertController.view.trailingAnchor, constant: -10),
            datePicker.bottomAnchor.constraint(equalTo: alertController.view.bottomAnchor, constant: -60)
        ])
        
        let selectAction = UIAlertAction(title: "Select", style: .default) { _ in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy/MM/dd"
            let selectedDate = datePicker.date
            self.dateTextField.text = dateFormatter.string(from: selectedDate)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        // Add actions to the alert controller
        alertController.addAction(selectAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }

    
//    @IBAction func buttonTapped(_ sender: UIButton) {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let otpViewController = storyboard.instantiateViewController(withIdentifier: "OTP")
//            present(otpViewController, animated: true, completion: nil)
//        }
}
    
