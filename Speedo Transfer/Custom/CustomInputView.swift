//
//  CustomInputView.swift
//  FinalProjectBM
//
//  Created by groub G  on 05/08/2024.
//

import UIKit


class CustomInputView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    var model: InputViewUiModel? {
        
        didSet{
            configureUi()
        }
    }
    override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
     
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            commonInit()
        }
        
        private func commonInit() {
            Bundle.main.loadNibNamed("CustomInputView", owner: self, options: nil)
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            
            setUpUi()
                  }
    
    private func setUpUi() {
        inputTextField.layer.cornerRadius = 6
        inputTextField.layer.borderWidth = 1.5
        inputTextField.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    private func configureUi() {
//        let profileView = UIImageView(frame: CGRect(x: 50, y: 50, width: 24, height: 24))
//        let profileImage = UIImage(named: model?.imageName ?? "")
//            profileView.image = profileImage
    
//        inputTextField.rightView = profileView
//        inputTextField.rightViewMode = .always
       
        
        inputTextField.placeholder = model?.placeHolder ?? ""
        
        titleName.text = model?.titleLabel ?? ""
        
        setUpTextFieldKeyBoard(inputType: model?.inputType ?? .none)
        
        
      
            }
    
    private func setUpTextFieldKeyBoard(inputType: keyBoardTextField) {
    
        switch inputType{
        case .passward:
            inputTextField.textContentType = .password
            inputTextField.isSecureTextEntry = true
        case .email:
            inputTextField.textContentType = .emailAddress
            inputTextField.isSecureTextEntry = false
        case .none:
            inputTextField.textContentType = .none
            inputTextField.isSecureTextEntry = false
        case .creditCardNo:
            inputTextField.textContentType = .creditCardNumber
            inputTextField.isSecureTextEntry = false
            
        }
    }
    
    func getInputText()-> String? {
        inputTextField.text
    }
}
