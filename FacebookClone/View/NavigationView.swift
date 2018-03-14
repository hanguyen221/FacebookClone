//
//  NavigationView.swift
//  FacebookClone
//
//  Created by Ha Nguyen on 12/17/17.
//  Copyright © 2017 Ha Nguyen. All rights reserved.
//

import UIKit

public enum BarButtonItems {
    case back
    case cancel
    case edit
    case new
}

class NavigationView: UIView {
    
    var controller: BaseController?
    var cancelSearch: () -> Void = {}
    var onRightBarButton: () -> Void = {}
    
    let searchIconView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "ic_search_white")!.alpha(0.7)
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "ic_cancel_white")!.alpha(0.7)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.contentMode = .scaleAspectFill
        button.isHidden = true
        return button
    }()
    
    lazy var searchTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Search"
        tf.textColor = .white
        tf.font = UIFont.systemFont(ofSize: 15)
        return tf
    }()
    
    let searchView: UIView = {
        let view = UIView()
        view.backgroundColor = Const.COLOR_FACEBOOK_SUPER_LIGHT_BLUE
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    let leftBarButton: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    let rightBarButton: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("New", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        self.backgroundColor = Const.COLOR_FACEBOOK_BLUE
    }
    
    var searchViewLeftConstraint: NSLayoutConstraint?
    
    func setupViews() {
        self.addSubview(searchView)
        setupSearchView()
        searchViewLeftConstraint = self.searchView.getLeftConstraint()
        
        searchView.addSubview(searchIconView)
        setupSearchIconView()
        
        searchView.addSubview(clearButton)
        setupClearButton()
        
        searchView.addSubview(searchTextField)
        setupSearchTextField()
        
        self.addSubview(leftBarButton)
        setupLeftBarButton()
        
        self.addSubview(rightBarButton)
        setupRightBarButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSearchView() {
        searchView.anchorWithConstraints(leftAnchor: self.leftAnchor,
                                         leftConstant: 60,
                                         rightAnchor: self.rightAnchor,
                                         rightConstant: 60,
                                         centerYAnchor: self.centerYAnchor,
                                         centerYConstant: 10,
                                         heightConstant: 30)
    }
    
    func setupSearchIconView() {
        searchIconView.anchorWithConstraints(leftAnchor: searchView.leftAnchor,
                                             leftConstant: 8,
                                             centerYAnchor: searchView.centerYAnchor,
                                             widthConstant: 20,
                                             heightConstant: 20)
    }
    
    func setupLeftBarButton() {
        leftBarButton.anchorWithConstraints(topAnchor: searchView.topAnchor,
                                            bottomAnchor: searchView.bottomAnchor,
                                            rightAnchor: searchView.leftAnchor,
                                            widthConstant: 60)
        setLeftBarButton(button: .back)
    }
    
    func setupClearButton() {
        clearButton.anchorWithConstraints(rightAnchor: searchView.rightAnchor,
                                          rightConstant: 8,
                                          centerYAnchor: searchView.centerYAnchor,
                                          widthConstant: 16,
                                          heightConstant: 16)
        clearButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clearSearch)))
    }
    
    func setupRightBarButton() {
        rightBarButton.anchorWithConstraints(topAnchor: searchView.topAnchor,
                                             leftAnchor: searchView.rightAnchor,
                                             bottomAnchor: searchView.bottomAnchor,
                                             widthConstant: 60)
        setRightBarButton(button: .new)
    }
    
    @objc func clearSearch() {
        searchTextField.text = ""
        cancelSearch()
    }
    
    func setupSearchTextField() {
        searchTextField.anchorWithConstraints(topAnchor: searchView.topAnchor,
                                              leftAnchor: searchIconView.rightAnchor,
                                              leftConstant: 4,
                                              bottomAnchor: searchView.bottomAnchor,
                                              rightAnchor: clearButton.leftAnchor)
    }
    
    func setLeftBarButton(button: BarButtonItems) {
        resetButton(button: leftBarButton)
        switch button {
        case .back:
            var img = UIImage(named: "ic_back")!
            img = Utils.resizeImage(image: img, targetSize: CGSize(width: img.size.width * 0.7, height: img.size.height * 0.7))
            leftBarButton.setImage(img, for: .normal)
            leftBarButton.tintColor = Const.COLOR_FACEBOOK_WHITE
            leftBarButton.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        case .edit:
            leftBarButton.setTitle("Edit", for: .normal)
            leftBarButton.setTitleColor(.white, for: .normal)
            leftBarButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        default:
            break
        }
    }
    
    func setRightBarButton(button: BarButtonItems) {
        resetButton(button: rightBarButton)
        switch button {
        case .cancel:
            rightBarButton.setTitle("Cancel", for: .normal)
            rightBarButton.setTitleColor(.white, for: .normal)
            rightBarButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            rightBarButton.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        case .new:
            var img = UIImage(named: "ic_add")!
            img = Utils.resizeImage(image: img, targetSize: CGSize(width: img.size.width * 0.7, height: img.size.height * 0.7))
            rightBarButton.setImage(img, for: .normal)
            rightBarButton.tintColor = Const.COLOR_FACEBOOK_WHITE
            rightBarButton.addTarget(self, action: #selector(handleNew), for: .touchUpInside)
        default:
            break
        }
    }
    
    func resetButton(button: UIButton) {
        button.setImage(nil, for: .normal)
        button.setTitle(nil, for: .normal)
        rightBarButton.removeTarget(self, action: nil, for: .allEvents)
    }
    
    @objc func handleBack() {
        controller?.navigationController?.popViewController(animated: true)
    }
    
    @objc func handleCancel() {
        searchTextField.text = ""
        searchTextField.resignFirstResponder()
        clearButton.isHidden = true
        setRightBarButton(button: .new)
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.searchViewLeftConstraint?.constant += 44
            self.controller?.view.layoutIfNeeded()
        }, completion: {_ in
            self.leftBarButton.isHidden = false
        })
        cancelSearch()
    }
    
    @objc func handleNew() {
        onRightBarButton()
    }
    
    func textFieldDidBeginEditing() {
        clearButton.isHidden = false
        setRightBarButton(button: .cancel)
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.leftBarButton.isHidden = true
            self.searchViewLeftConstraint?.constant -= 44
            self.controller?.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func textFieldShouldReturn() {
        searchTextField.resignFirstResponder()
        clearButton.isHidden = true
        setRightBarButton(button: .new)
    }
    
}
