//
//  NetworkResult.swift
//  iOS_homework_login
//
//  Created by 김성은 on 16/05/2020.
//  Copyright © 2020 김성은. All rights reserved.
//

import Foundation
import UIKit

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
