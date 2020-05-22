//
//  APIConstants.swift
//  iOS_homework_login
//
//  Created by 김성은 on 16/05/2020.
//  Copyright © 2020 김성은. All rights reserved.
//

import Foundation
import UIKit

struct APIConstants {
    static let baseURL = "http://13.209.144.115:3333"
    static let signinURL = APIConstants.baseURL + "/user/signin"
    static let signupURL = APIConstants.baseURL + "/user/signup"
}
