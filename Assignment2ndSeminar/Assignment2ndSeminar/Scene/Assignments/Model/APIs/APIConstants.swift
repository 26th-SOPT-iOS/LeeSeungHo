//
//  APIConstants.swift
//  Assignment2ndSeminar
//
//  Created by elesahich on 2020/05/19.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

struct APIConstants {
    static let baseURL = "http://13.209.144.115:3333"
    static let signinURL = APIConstants.baseURL + "/user/signin"
    static let signupURL = APIConstants.baseURL + "/user/signup"
}
