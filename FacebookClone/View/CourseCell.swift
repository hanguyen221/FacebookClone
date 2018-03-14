//
//  CourseCell.swift
//  FacebookClone
//
//  Created by Ha Nguyen on 12/18/17.
//  Copyright © 2017 Ha Nguyen. All rights reserved.
//

import UIKit

class CourseCell: UITableViewCell {
    let courseImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "favicon")
        return view
    }()
    
    let infoStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        return sv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Course Name"
        return label
    }()
    
    let shortDesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Cousre desc"
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(courseImageView)
        setupCourseImageView()
        
        addSubview(infoStackView)
        setupInfoStackView()
    }
    
    func setupCourseImageView() {
        courseImageView.anchorWithConstraints(leftAnchor: leftAnchor,
                                         leftConstant: 16,
                                         bottomAnchor: bottomAnchor,
                                         bottomConstant: 8,
                                         centerYAnchor: centerYAnchor,
                                         widthConstant: 56,
                                         heightConstant: 56)
        courseImageView.layer.cornerRadius = 5
        courseImageView.layer.masksToBounds = true
    }
    
    func setupInfoStackView() {
        infoStackView.anchorWithConstraints(topAnchor: courseImageView.topAnchor,
                                            leftAnchor: courseImageView.rightAnchor,
                                            leftConstant: 16,
                                            centerYAnchor: centerYAnchor)
        infoStackView.addArrangedSubview(nameLabel)
        infoStackView.addArrangedSubview(shortDesLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
