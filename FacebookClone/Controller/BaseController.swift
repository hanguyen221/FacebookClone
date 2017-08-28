//
//  BaseController.swift
//  FacebookClone
//
//  Created by Ha Nguyen on 8/28/17.
//  Copyright © 2017 Ha Nguyen. All rights reserved.
//

import UIKit

class BaseController: UIViewController {
    
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
    
    func keyboardWillShow(notification: NSNotification) {
        
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
    
    func keyboardWillHide(notification: NSNotification) {
        
        guard isKeyboardOn else {
            return
        }
        
        handleKeyboardHiding()
        
        isKeyboardOn = false
    }
    
    func handleKeyboardHiding() {
        
    }

}







