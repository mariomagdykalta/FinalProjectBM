//
//  OTP.swift
//  FinalProjectBM
//
//  Created by groub G  on 05/08/2024.
//
import UIKit

class OTP: UIViewController, UITextViewDelegate {

    @IBOutlet weak var backGround: UIView!
    @IBOutlet weak var OTPtextView1: UITextView!
    @IBOutlet weak var OTPtextView2: UITextView!
    @IBOutlet weak var OTPtextView3: UITextView!
    @IBOutlet weak var OTPtextView4: UITextView!
    @IBOutlet weak var OTPtextView5: UITextView!
    @IBOutlet weak var OTPtextView6: UITextView!
    @IBOutlet weak var actionButton: UIButton!

    let customBorderColorFilled = UIColor(red: 135/255.0, green: 30/255.0, blue: 53/255.0, alpha: 1.0)
    let customBorderColorEmpty = UIColor(red: 189/255.0, green: 189/255.0, blue: 189/255.0, alpha: 1.0)
    let buttonColorFilled = UIColor(red: 135/255.0, green: 30/255.0, blue: 53/255.0, alpha: 1.0)
    let buttonColorEmpty = UIColor(red: 137/255.0, green: 136/255.0, blue: 134/255.0, alpha: 1.0)
    let buttonTitleFilled = "Sign on"
    let buttonTitleEmpty = "Submit Refill"

    override func viewDidLoad() {
        super.viewDidLoad()

        let textViews = [OTPtextView1, OTPtextView2, OTPtextView3, OTPtextView4, OTPtextView5, OTPtextView6]
        for textView in textViews {
            textView?.layer.cornerRadius = 6
            textView?.layer.borderWidth = 1.5
            textView?.layer.borderColor = UIColor.lightGray.cgColor
            textView?.delegate = self
            textView?.isScrollEnabled = false
            textView?.keyboardType = .numberPad // Set the keyboard type to number pad
        }

        setupTextViewBorders()
        updateBorderColors()
        updateButtonAppearance()

        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }

    @IBAction func ResendOTPButton(_ sender: Any) {
        showLoadingVC()
    }

    @objc private func actionButtonTapped() {
        if actionButton.backgroundColor == buttonColorFilled {
            pushToAccountConnectedVC()
        }
    }

    private func pushToAccountConnectedVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let accountConnectedVC = storyboard.instantiateViewController(withIdentifier: "AccountConnected") as? AccountConnected {
            self.navigationController?.pushViewController(accountConnectedVC, animated: true)
        }
    }

    func textViewDidChange(_ textView: UITextView) {
        let text = textView.text

        if text?.utf16.count == 1 {
            switch textView {
            case OTPtextView1:
                OTPtextView2.becomeFirstResponder()
            case OTPtextView2:
                OTPtextView3.becomeFirstResponder()
            case OTPtextView3:
                OTPtextView4.becomeFirstResponder()
            case OTPtextView4:
                OTPtextView5.becomeFirstResponder()
            case OTPtextView5:
                OTPtextView6.becomeFirstResponder()
            case OTPtextView6:
                OTPtextView6.resignFirstResponder()
            default:
                break
            }
        } else if text?.utf16.count == 0 {
            switch textView {
            case OTPtextView6:
                OTPtextView5.becomeFirstResponder()
            case OTPtextView5:
                OTPtextView4.becomeFirstResponder()
            case OTPtextView4:
                OTPtextView3.becomeFirstResponder()
            case OTPtextView3:
                OTPtextView2.becomeFirstResponder()
            case OTPtextView2:
                OTPtextView1.becomeFirstResponder()
            case OTPtextView1:
                OTPtextView1.resignFirstResponder()
            default:
                break
            }
        }

        updateBorderColors()
        updateButtonAppearance()
    }

    func textViewDidChangeSelection(_ textView: UITextView) {
        if let text = textView.text, text.count > 1 {
            textView.text = String(text.prefix(1))
        }
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard let currentText = textView.text else { return true }
        let newLength = currentText.count + text.count - range.length

        // Allow only numeric input
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: text)
        return newLength <= 1 && allowedCharacters.isSuperset(of: characterSet)
    }

    private func setupTextViewBorders() {
        let textViews = [OTPtextView1, OTPtextView2, OTPtextView3, OTPtextView4, OTPtextView5, OTPtextView6]
        for textView in textViews {
            textView?.layer.borderWidth = 1.0
            textView?.layer.cornerRadius = 5.0
        }
    }

    private func updateBorderColors() {
        OTPtextView1.layer.borderColor = OTPtextView1.text.isEmpty ? customBorderColorEmpty.cgColor : customBorderColorFilled.cgColor
        OTPtextView2.layer.borderColor = OTPtextView2.text.isEmpty ? customBorderColorEmpty.cgColor : customBorderColorFilled.cgColor
        OTPtextView3.layer.borderColor = OTPtextView3.text.isEmpty ? customBorderColorEmpty.cgColor : customBorderColorFilled.cgColor
        OTPtextView4.layer.borderColor = OTPtextView4.text.isEmpty ? customBorderColorEmpty.cgColor : customBorderColorFilled.cgColor
        OTPtextView5.layer.borderColor = OTPtextView5.text.isEmpty ? customBorderColorEmpty.cgColor : customBorderColorFilled.cgColor
        OTPtextView6.layer.borderColor = OTPtextView6.text.isEmpty ? customBorderColorEmpty.cgColor : customBorderColorFilled.cgColor
    }

    private func updateButtonAppearance() {
        let allFilled = [OTPtextView1, OTPtextView2, OTPtextView3, OTPtextView4, OTPtextView5, OTPtextView6].allSatisfy { !$0.text.isEmpty }

        actionButton.backgroundColor = allFilled ? buttonColorFilled : buttonColorEmpty
        actionButton.setTitle(allFilled ? buttonTitleFilled : buttonTitleEmpty, for: .normal)

        // Ensure button text color is always white
        actionButton.setTitleColor(.white, for: .normal)
        actionButton.isEnabled = allFilled
    }

    func showLoadingVC() {
        print("showLoadingVC called")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let loadingVC = storyboard.instantiateViewController(withIdentifier: "LoadingVC") as? LoadingVC {
            loadingVC.modalPresentationStyle = .fullScreen
            present(loadingVC, animated: true, completion: nil)
        }
    }
}
