//
//  BaseController.swift
//  FacebookClone
//
//  Created by Ha Nguyen on 8/28/17.
//  Copyright © 2017 Ha Nguyen. All rights reserved.
//

import UIKit

class BaseController: UIViewController, UITextFieldDelegate {
    
    let navigationView = NavigationView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
    
    func setupNavView() {
        view.addSubview(navigationView)
        navigationView.controller = self
        navigationView.searchTextField.delegate = self
        navigationView.anchorWithConstraints(topAnchor: view.topAnchor,
                                             leftAnchor: view.leftAnchor,
                                             rightAnchor: view.rightAnchor,
                                             heightConstant: 70)
        navigationView.setupViews()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        navigationView.textFieldDidBeginEditing()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == navigationView.searchTextField) {
            navigationView.textFieldShouldReturn()
            return true
        }
        return false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        deregisterFromKeyboardNotifications()
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    func deregisterFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
    
    var keyboardHeight: CGFloat = 0
    private var isKeyboardOn: Bool = false
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        guard !isKeyboardOn else {
            return
        }
        
        var info = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size
        
        if keyboardSize?.height != nil {
            keyboardHeight = (keyboardSize?.height)!
        } else {
            return
        }
        
        handleKeyboardShowing()
        
        isKeyboardOn = true
    }
    
    func handleKeyboardShowing() {
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        
        guard isKeyboardOn else {
            return
        }
        
        handleKeyboardHiding()
        
        isKeyboardOn = false
    }
    
    func handleKeyboardHiding() {
        
    }
    
    func defaultAlertWithMessage(_ message: String, completion: (() -> Void)? = nil) {
        let alertVC = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "OK", style: .default) { (alert) in
            guard let completion = completion else {
                return
            }
            completion()
        }
        alertVC.addAction(actionOK)
        present(alertVC, animated: true, completion: nil)
    }

}







