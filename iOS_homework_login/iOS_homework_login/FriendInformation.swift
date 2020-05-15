//
//  FriendInformation.swift
//  iOS_homework_login
//
//  Created by 김성은 on 15/05/2020.
//  Copyright © 2020 김성은. All rights reserved.
//

import Foundation
import UIKit

struct FriendInformation {
    var imageName: String
    var name: String
    var status: String
    
    init(imageName: String, name: String, status: String) {
        self.imageName = imageName
        self.name = name
        self.status = status
    }
}
