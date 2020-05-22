//
//  NetworkResult.swift
//  Assignment2ndSeminar
//
//  Created by elesahich on 2020/05/19.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

enum NetworkResult<T> {
    
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
