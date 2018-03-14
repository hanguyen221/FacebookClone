//
//  Extension+UIImage.swift
//  FacebookClone
//
//  Created by Ha Nguyen on 12/17/17.
//  Copyright © 2017 Ha Nguyen. All rights reserved.
//

import UIKit

extension UIImage {
    func alpha(_ value: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

