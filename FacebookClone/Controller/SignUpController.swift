//
//  SignUpController.swift
//  FacebookClone
//
//  Created by Ha Nguyen on 8/28/17.
//  Copyright © 2017 Ha Nguyen. All rights reserved.
//

import UIKit

class SignUpController: BaseController, UITextFieldDelegate {
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up for Facebook"
        label.textColor = Const.COLOR_FACEBOOK_BLUE
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let noticeLabel: UILabel = {
        let label = UILabel()
        label.text = "You'll use this email when you log in and if you ever need to reset your password"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let inputContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var emailTextField: PaddedTextField = {
        let txtField = PaddedTextField()
        txtField.placeholder = "Enter your email address"
        txtField.backgroundColor = Const.COLOR_FACEBOOK_WHITE
        txtField.delegate = self
        txtField.layer.cornerRadius = 3
        txtField.layer.masksToBounds = true
        return txtField
    }()
    
    lazy var passwordTextField: PaddedTextField = {
        let txtField = PaddedTextField()
        txtField.placeholder = "Enter your password"
        txtField.backgroundColor = Const.COLOR_FACEBOOK_WHITE
        txtField.delegate = self
        txtField.layer.cornerRadius = 3
        txtField.layer.masksToBounds = true
        return txtField
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(Const.COLOR_WHITE_ALPHA15, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.backgroundColor = Const.COLOR_FACEBOOK_BLUE
        button.layer.cornerRadius = 3
        button.layer.masksToBounds = true
        button.isEnabled = false
        return button
    }()
    
    let backToLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Already have an account?", for: .normal)
        button.setTitleColor(Const.COLOR_FACEBOOK_MEDIUM_BLUE, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        return button
    }()
    
    func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    let separatorLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Const.COLOR_FACEBOOK_LIGHT_GRAY
        
        view.addSubview(titleLabel)
        view.addSubview(noticeLabel)
        view.addSubview(inputContainerView)
        inputContainerView.addSubview(emailTextField)
        inputContainerView.addSubview(passwordTextField)
        view.addSubview(signUpButton)
        view.addSubview(backToLoginButton)
        view.addSubview(separatorLineView)
        
        setupTitleLabel()
        setupNoticeLabel()
        setupInputContainerView()
        setupEmailTextField()
        setupSignUpButton()
        setupPasswordTextField()
        setupBackToLoginButton()
        setupSeparatorLineView()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func setupTitleLabel() {
        titleLabel.anchorWithConstraints(bottomAnchor: noticeLabel.topAnchor,
                                         bottomConstant: 16,
                                         centerXAnchor: view.centerXAnchor)
    }
    
    private func setupNoticeLabel() {
        noticeLabel.anchorWithConstraints(leftAnchor: view.leftAnchor,
                                          leftConstant: 24,
                                          bottomAnchor: inputContainerView.topAnchor,
                                          bottomConstant: 16,
                                          centerXAnchor: view.centerXAnchor)
        noticeLabel.sizeToFit()
    }
    
    private var inputContainerViewCenterYConstraint: NSLayoutConstraint?
    
    private func setupInputContainerView() {
        inputContainerView.anchorWithConstraints(centerXAnchor: view.centerXAnchor,
                                                 centerYAnchor: view.centerYAnchor,
                                                 widthConstant: view.frame.size.width - 32,
                                                 heightConstant: 90)
        inputContainerViewCenterYConstraint = inputContainerView.getCenterYConstraint()
    }
    
    private func setupEmailTextField() {
        emailTextField.anchorWithConstraints(topAnchor: inputContainerView.topAnchor,
                                             leftAnchor: inputContainerView.leftAnchor,
                                             rightAnchor: inputContainerView.rightAnchor,
                                             heightConstant: 40)
    }
    
    private func setupSignUpButton() {
        signUpButton.anchorWithConstraints(topAnchor: inputContainerView.bottomAnchor,
                                           topConstant: 24,
                                           leftAnchor: view.leftAnchor,
                                           leftConstant:  16,
                                           centerXAnchor: view.centerXAnchor,
                                           heightConstant: 36)
    }
    
    private func setupPasswordTextField() {
        passwordTextField.anchorWithConstraints(leftAnchor: inputContainerView.leftAnchor,
                                                bottomAnchor: inputContainerView.bottomAnchor,
                                                rightAnchor: inputContainerView.rightAnchor,
                                                heightConstant: 40)
    }
    
    private var backToLoginButtonBottomConstraint: NSLayoutConstraint?
    
    private func setupBackToLoginButton() {
        backToLoginButton.anchorWithConstraints(leftAnchor: view.leftAnchor,
                                                bottomAnchor: view.bottomAnchor,
                                                rightAnchor: view.rightAnchor,
                                                heightConstant: 40)
        backToLoginButtonBottomConstraint = backToLoginButton.getBottomConstraint()
    }
    
    private func setupSeparatorLineView() {
        separatorLineView.anchorWithConstraints(leftAnchor: view.leftAnchor,
                                                bottomAnchor: backToLoginButton.topAnchor,
                                                rightAnchor: view.rightAnchor,
                                                heightConstant: 1)
    }
    
    override func handleKeyboardShowing() {
        backToLoginButtonBottomConstraint?.constant -= keyboardHeight
        inputContainerViewCenterYConstraint?.constant -= keyboardHeight / 2
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { 
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    override func handleKeyboardHiding() {
        backToLoginButtonBottomConstraint?.constant += keyboardHeight
        inputContainerViewCenterYConstraint?.constant += keyboardHeight / 2
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if emailTextField.text! != "" && passwordTextField.text! != "" {
            signUpButton.isEnabled = true
            signUpButton.setTitleColor(Const.COLOR_FACEBOOK_WHITE, for: .normal)
        } else {
            signUpButton.isEnabled = false
            signUpButton.setTitleColor(Const.COLOR_WHITE_ALPHA15, for: .normal)
        }
    }
}













