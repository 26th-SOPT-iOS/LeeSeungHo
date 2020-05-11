//
//  Friends.swift
//  Assignment2ndSeminar
//
//  Created by elesahich on 2020/05/10.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

struct Friends {
    
    var name: String
    var profileImage: UIImage?
    var subTitle: String
    
    init(name: String, profileImage: String, subTitle: String) {
        self.name = name
        self.profileImage = UIImage(named: profileImage)
        self.subTitle = subTitle
    }
}




