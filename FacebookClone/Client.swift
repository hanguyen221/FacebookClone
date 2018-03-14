//
//  Client.swift
//  FacebookClone
//
//  Created by Ha Nguyen on 10/8/17.
//  Copyright © 2017 Ha Nguyen. All rights reserved.
//

import Foundation

final class Client {
    
    private let modelUser = ModelUser()
    
    public static let shared = Client()
    
    func getModelUser() -> ModelUser {
        return modelUser
    }
    
}
