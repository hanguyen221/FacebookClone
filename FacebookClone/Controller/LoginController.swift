//
//  LoginController.swift
//  FacebookClone
//
//  Created by Ha Nguyen on 8/26/17.
//  Copyright © 2017 Ha Nguyen. All rights reserved.
//

import UIKit

class LoginController: BaseController, UITextFieldDelegate {
    
    let blueHeaderView: UIView = {
        let view = UIView()
        view.backgroundColor = Const.COLOR_FACEBOOK_BLUE
        return view
    }()
    
    let headerImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "headerImage")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let whiteFacebookImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "ic_facebook_white")
        iv.layer.cornerRadius = 3
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let inputContainerView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 3
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var emailTextField: PaddedTextField = {
        let txtField = PaddedTextField()
        txtField.placeholder = "Email or phone number"
        txtField.returnKeyType = UIReturnKeyType.next
        txtField.delegate = self
        return txtField
    }()
    
    let separatorLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var passwordTextField: PaddedTextField = {
        let txtField = PaddedTextField()
        txtField.placeholder = "Password"
        txtField.returnKeyType = UIReturnKeyType.done
        txtField.delegate = self
        return txtField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.backgroundColor = Const.COLOR_FACEBOOK_BLUE
        button.setTitleColor(Const.COLOR_WHITE_ALPHA15, for: .normal)
        button.isEnabled = false
        return button
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot Password?", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 11)
        button.setTitleColor(Const.COLOR_FACEBOOK_BLUE, for: .normal)
        return button
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up for Facebook", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.setTitleColor(Const.COLOR_FACEBOOK_BLUE, for: .normal)
        button.layer.borderColor = Const.COLOR_FACEBOOK_MEDIUM_BLUE.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 3
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    func handleSignUp() {
        let signUpController = SignUpController()
        present(signUpController, animated: true, completion: nil)
    }
    
    let orLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let orLabel: UILabel = {
        let label = UILabel()
        label.text = "OR"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.backgroundColor = .white
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(blueHeaderView)
        blueHeaderView.addSubview(headerImageView)
        blueHeaderView.addSubview(whiteFacebookImageView)
        
        view.addSubview(inputContainerView)
        setupInputContainerView()
        
        inputContainerView.addSubview(emailTextField)
        inputContainerView.addSubview(separatorLineView)
        inputContainerView.addSubview(passwordTextField)
        
        view.addSubview(orLineView)
        view.addSubview(orLabel)
        view.addSubview(loginButton)
        view.addSubview(forgotPasswordButton)
        view.addSubview(signUpButton)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        
        setupBlueHeaderView()
        setupHeaderImageView()
        setupWhiteFacebookImageView()
        setupEmailTextField()
        setupSeparatorLineView()
        setupPasswordTextField()
        setupLoginButton()
        setupForgotPasswordButton()
        setupSignUpButton()
        setupOrLineView()
        setupOrLabel()
    }
    
    override func handleKeyboardShowing() {
        signUpButtonBottomConstraint?.constant -= keyboardHeight
        inputContainerViewCenterYAnchor?.constant -= keyboardHeight / 2 + 20
        whiteFacebookImageViewHeightConstraint?.constant -= 14
        whiteFacebookImageViewWidthConstraint?.constant -= 14
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.headerImageView.alpha = 0
            self.orLineView.alpha = 0
            self.orLabel.alpha = 0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    override func handleKeyboardHiding() {
        signUpButtonBottomConstraint?.constant += keyboardHeight
        inputContainerViewCenterYAnchor?.constant += keyboardHeight / 2 + 20
        whiteFacebookImageViewHeightConstraint?.constant += 14
        whiteFacebookImageViewWidthConstraint?.constant += 14
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.headerImageView.alpha = 1
            self.orLineView.alpha = 1
            self.orLabel.alpha = 1
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func setupBlueHeaderView() {
        blueHeaderView.anchorWithConstraints(topAnchor: view.topAnchor,
                                             leftAnchor: view.leftAnchor,
                                             bottomAnchor: inputContainerView.topAnchor,
                                             bottomConstant: 30,
                                             rightAnchor: view.rightAnchor)
    }
    
    private var whiteFacebookImageViewWidthConstraint: NSLayoutConstraint?
    private var whiteFacebookImageViewHeightConstraint: NSLayoutConstraint?
    
    private func setupWhiteFacebookImageView() {
        whiteFacebookImageView.anchorWithConstraints(centerXAnchor: blueHeaderView.centerXAnchor,
                                                     centerYAnchor: blueHeaderView.centerYAnchor,
                                                     widthConstant: 44,
                                                     heightConstant: 44)
        whiteFacebookImageViewWidthConstraint = whiteFacebookImageView.getWidthConstraint()
        whiteFacebookImageViewHeightConstraint = whiteFacebookImageView.getHeightConstraint()
    }
    
    private func setupHeaderImageView() {
        headerImageView.anchorWithConstraints(leftAnchor: blueHeaderView.leftAnchor,
                                              bottomAnchor: blueHeaderView.bottomAnchor,
                                              rightAnchor: blueHeaderView.rightAnchor,
                                              heightConstant: 30)
        let image = UIImage(named: "headerImage")
        view.layoutIfNeeded()
        headerImageView.getHeightConstraint()?.constant = (image?.size.height)! * headerImageView.frame.size.width / (image?.size.width)!
        view.layoutIfNeeded()
    }
    
    private var inputContainerViewCenterYAnchor: NSLayoutConstraint?
    
    private func setupInputContainerView() {
        inputContainerView.anchorWithConstraints(centerXAnchor: view.centerXAnchor,
                                                 centerYAnchor: view.centerYAnchor,
                                                 widthConstant: view.frame.width - 32,
                                                 heightConstant: 80)
        inputContainerViewCenterYAnchor = inputContainerView.getCenterYConstraint()
    }
    
    private func setupEmailTextField() {
        emailTextField.anchorWithConstraints(topAnchor: inputContainerView.topAnchor,
                                             leftAnchor: inputContainerView.leftAnchor,
                                             rightAnchor: inputContainerView.rightAnchor,
                                             heightConstant: 40)
    }
    
    private func setupSeparatorLineView() {
        separatorLineView.anchorWithConstraints(leftAnchor: inputContainerView.leftAnchor,
                                                rightAnchor: inputContainerView.rightAnchor,
                                                centerYAnchor: inputContainerView.centerYAnchor,
                                                heightConstant: 1)
    }
    
    private func setupPasswordTextField() {
        passwordTextField.anchorWithConstraints(leftAnchor: inputContainerView.leftAnchor,
                                                bottomAnchor: inputContainerView.bottomAnchor,
                                                rightAnchor: inputContainerView.rightAnchor,
                                                heightConstant: 40)
    }
    
    private func setupLoginButton() {
        loginButton.anchorWithConstraints(topAnchor: inputContainerView.bottomAnchor,
                                          topConstant: 12,
                                          leftAnchor: view.leftAnchor,
                                          leftConstant: 16,
                                          centerXAnchor: view.centerXAnchor,
                                          heightConstant: 36)
    }
    
    private func setupForgotPasswordButton() {
        forgotPasswordButton.anchorWithConstraints(topAnchor: loginButton.bottomAnchor,
                                                   topConstant: 8,
                                                   centerXAnchor: view.centerXAnchor)
    }
    
    private var signUpButtonBottomConstraint: NSLayoutConstraint?
    
    private func setupSignUpButton() {
        signUpButton.anchorWithConstraints(leftAnchor: view.leftAnchor,
                                           leftConstant: 16,
                                           bottomAnchor: view.bottomAnchor,
                                           bottomConstant: 16,
                                           centerXAnchor: view.centerXAnchor,
                                           heightConstant: 36)
        signUpButtonBottomConstraint = signUpButton.getBottomConstraint()
    }
    
    private func setupOrLineView() {
        orLineView.anchorWithConstraints(leftAnchor: view.leftAnchor,
                                         leftConstant: 36,
                                         bottomAnchor: signUpButton.topAnchor,
                                         bottomConstant: 24,
                                         centerXAnchor: view.centerXAnchor,
                                         heightConstant: 1)
    }
    
    private func setupOrLabel() {
        orLabel.anchorWithConstraints(centerXAnchor: view.centerXAnchor,
                                      centerYAnchor: orLineView.centerYAnchor,
                                      widthConstant: 36)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if emailTextField.text! != "" && passwordTextField.text! != "" {
            loginButton.isEnabled = true
            loginButton.setTitleColor(Const.COLOR_FACEBOOK_WHITE, for: .normal)
        } else {
            loginButton.isEnabled = false
            loginButton.setTitleColor(Const.COLOR_WHITE_ALPHA15, for: .normal)
        }
    }
}












